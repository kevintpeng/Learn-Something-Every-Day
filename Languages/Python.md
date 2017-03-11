# Python Project Architecture
### __future__
`import from __future__` allows you to access new features which are not currently compatable with the current interpreter
- `import __future__` module allows you to see when features were added and became default with `__future__.<feature>`

### Modules -- [source](https://docs.python.org/3/tutorial/modules.html#packages)
In python, .py files are **modules** of definitions and statements
- in a module, `__name__` is the name of the module
- statements in a module are executed during the import statement, used for module initialization
- each module has a private symbol table (sheltered from global variable scope)
- `from <module> import *` will import names from a module into the importing module's symbol table
  - names beginning with `_` are not imported
- `if __name__ == "__main__"` allows you to make a module both a usable script and a module to be imported
- search order for imports: built-in module, `.py` file in `sys.path`
- `dir()` is used to find out which names a module defines

### Packages
Packages provide namespacing for modules, like `A.B` for package `A` and submodule `B`
- `__init__.py` initializes a package (in its current directory, based on the directory name)
- packages may be nested, to namespace imports, but every item except the last must be a package in statements like `import item.subitem.subsubitem`
- in `__init__.py`, a list named `__all__` is the list of submodules to be imported when `from <package> import *` is called
- within a package, relative imports can be made with `from .. import <submodule>`

### Architecture Example: [Tensorflow](https://github.com/tensorflow/tensorflow)
- `tensorflow` directory defines the package
  - `__init__.py` imports 3.x absolute_import, division and print_function from `__future__`
  - `from tensorflow.python import *`, which imports the list defined by `__all__` in the tensorflow.python package
    - `python/__init__.py` imports from tensorflow.core, tensorflow.framework, and sets default environment variables, and global default config
