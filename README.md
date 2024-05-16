## [[Virtual Environments]]
What is it? - Why would I want to?
- Keeps the tools and packages for each project singular to that project and organized in a repeatable and shippable manner.
If your on a mac you may require `pip3`, `python3`
### pip and pipenv
__pip__ 
- "Python Package Index" - Package management system used to install and manage software packages written in Python. When you want to use a Python library or tool created by someone else, you can typically install it using PIP
__pipenv__ 
- Pipenv is a higher-level tool which builds on top of two lower-level tools: pip, and virtualenv. It is used to manage Python packages and environments. It harnesses Pipfile, pip, and virtualenv into one single toolchain.
#### Commands
##### Global Scope
Install pipenv
`pip list` - shows what's globally installed from any location on machine
`pip uninstall pipenv`
*Will install this only once... ever. (most likely)*
`pip install pipenv` - To install pipenv globally and make it available as a command
##### Project Scope
- [ ] Create Project/Assignment/App directory
`mkdir assignmentName` 
`cd assignmentName`
`pip list` - to demonstrate current/global installations
- [ ] Install dependencies
__NOTE__: Some installations of windows require `python -m`  to interact with pipenv
`pipenv install flask pymysql` 
- Creates virtual environment *(but does not activate)*
- Installs flask, pymysql as python packages *(for this project only)*
- Creates pipfile and pipfile.lock. 
`pipenv shell ` 
- Will activate shell
- If this is run first it will create and activate
`pip list` - to demonstrate current/project installations

##### Other Useful Commands
`pipenv uninstall packageName` - uninstall a package
`pipenv --rm` - To remove if needed(nested environments etc)
`pipenv install flask==0.12.1` - Version Specificity
`pipenv graph` - print out a tree-like structure showing your dependencies
`pipenv lock`- This will create/update your`Pipfile.lock` which you’ll never need to (and are never meant to) edit manually. You should always use the generated file.
`pipenv --venv` - find out where your virtual environment is
`pipenv --where` - find out where your project home is
https://realpython.com/pipenv-guide/

---
## server.py
```python
from flask import Flask, render_template
app = Flask(__name__)
#! ^Header of Server^

#< Route Body/Block START
@app.route('/')
def hello_world():
  return 'Hello... World.'
#< Route Body/Block END

#! Footer of server
#! BELOW EVERY ROUTE BODY... EVERY ONE!
#! LAST THING IN THE FILE!
if __name__ == "__main__":
    app.run(debug=True, Port=5500)
```
`__name__` What is it?  
- The variable __name__ is passed as the first argument when creating an instance of the Flask object (a Python Flask application). In this case __name__ represents the name of the application package and it's used by Flask to identify resources like templates, static assets and the instance folder
`__main__` What is it?
- It's the top-level code environment. In Python, the special name __main__ is used for two important constructs: the name of the top-level environment of the program, which can be checked using the `__name__ == '__main__'` expression; and. the __main__.py file in Python packages.
[[if __name__ == __main__]]
Debug = True changes to false on deployment(shows errors upon failure.
- Why might we not want everyone to see this?
Port = 5500 is a good substitute if needed(Django port)
Below allows us to have a response without any urls defined
Also any urls that are not defined will get this response
```python
@app.route('/', defaults={'path': ''})
@app.route('/<path:path>')
def catch_all(path):
    return 'Invalid URL.'
```
