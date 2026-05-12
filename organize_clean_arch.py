import os
import shutil
import re

# We will just replace all imports with `package:folio/...` where they are using relative paths, 
# but it's simpler to just do text replacement for known package imports.
# To handle relative imports properly without a full Dart AST parser, 
# we'll do a best-effort absolute conversion or just rely on the fact that we can replace 'package:folio/xyz' 

def get_dart_files(directory):
    dart_files = []
    for root, _, files in os.walk(directory):
        for file in files:
            if file.endswith('.dart'):
                dart_files.append(os.path.join(root, file))
    return dart_files

def resolve_relative_import(filepath, import_path):
    # If it's already absolute or dart:, skip
    if import_path.startswith('package:') or import_path.startswith('dart:'):
        return import_path
    
    # Calculate the absolute package path
    # filepath is like lib/sections/main/widgets/_mobile_drawer.dart
    # import_path is like '../../provider/app_provider.dart'
    # relative to the directory of filepath
    dir_path = os.path.dirname(filepath)
    # removing 'lib/' from dir_path to get package relative path
    if dir_path.startswith('lib/'):
        dir_path = dir_path[4:]
    elif dir_path == 'lib':
        dir_path = ''
        
    parts = dir_path.split('/') if dir_path else []
    
    import_parts = import_path.split('/')
    for p in import_parts:
        if p == '..':
            if parts:
                parts.pop()
        elif p == '.':
            continue
        else:
            parts.append(p)
            
    resolved = '/'.join(parts)
    return f"package:folio/{resolved}"

def convert_to_absolute_imports():
    dart_files = get_dart_files('lib')
    for filepath in dart_files:
        with open(filepath, 'r') as f:
            content = f.read()
        
        # Find all imports and exports
        new_content = content
        def repl(match):
            keyword = match.group(1) # import or export
            quote = match.group(2) # ' or "
            path = match.group(3)
            rest = match.group(4) # anything after path like `as theme;`
            
            resolved_path = resolve_relative_import(filepath, path)
            return f"{keyword} {quote}{resolved_path}{quote}{rest}"

        new_content = re.sub(r'(import|export)\s+([\'"])(.*?)([\'"])(.*?;)', repl, new_content)
        
        if new_content != content:
            with open(filepath, 'w') as f:
                f.write(new_content)

# 1. Convert all to absolute imports
convert_to_absolute_imports()

# 2. Move files and folders
os.makedirs('lib/core', exist_ok=True)
os.makedirs('lib/presentation', exist_ok=True)
os.makedirs('lib/presentation/providers', exist_ok=True)
os.makedirs('lib/presentation/sections', exist_ok=True)
os.makedirs('lib/presentation/widgets', exist_ok=True)
os.makedirs('lib/data', exist_ok=True)
os.makedirs('lib/domain', exist_ok=True)

moves = [
    ('lib/animations', 'lib/core/animations'),
    ('lib/configs', 'lib/core/configs'),
    ('lib/constants.dart', 'lib/core/constants.dart'),
    ('lib/responsive', 'lib/core/responsive'),
    ('lib/utils', 'lib/core/utils'),
    ('lib/provider', 'lib/presentation/providers/legacy'), # move legacy inside providers
    ('lib/sections', 'lib/presentation/sections'),
    ('lib/widget', 'lib/presentation/widgets')
]

for src, dst in moves:
    if os.path.exists(src):
        if os.path.isdir(src):
            # For provider, we want to move contents to presentation/providers
            if src == 'lib/provider':
                for item in os.listdir(src):
                    shutil.move(os.path.join(src, item), 'lib/presentation/providers/')
                shutil.rmtree(src)
            # For sections and widget, we already created the dirs so we move contents or rename
            elif src == 'lib/sections':
                for item in os.listdir(src):
                    shutil.move(os.path.join(src, item), 'lib/presentation/sections/')
                shutil.rmtree(src)
            elif src == 'lib/widget':
                for item in os.listdir(src):
                    shutil.move(os.path.join(src, item), 'lib/presentation/widgets/')
                shutil.rmtree(src)
            else:
                shutil.move(src, dst)
        else:
            shutil.move(src, dst)

# 3. Update paths in files
path_replacements = {
    'package:folio/animations/': 'package:folio/core/animations/',
    'package:folio/configs/': 'package:folio/core/configs/',
    'package:folio/constants.dart': 'package:folio/core/constants.dart',
    'package:folio/responsive/': 'package:folio/core/responsive/',
    'package:folio/utils/': 'package:folio/core/utils/',
    'package:folio/provider/': 'package:folio/presentation/providers/',
    'package:folio/sections/': 'package:folio/presentation/sections/',
    'package:folio/widget/': 'package:folio/presentation/widgets/',
}

def update_imports():
    dart_files = get_dart_files('lib')
    for filepath in dart_files:
        with open(filepath, 'r') as f:
            content = f.read()
            
        new_content = content
        for old, new in path_replacements.items():
            new_content = new_content.replace(old, new)
            
        if new_content != content:
            with open(filepath, 'w') as f:
                f.write(new_content)

update_imports()
