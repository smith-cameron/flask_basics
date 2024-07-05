from flask import Flask, render_template  # Import Flask to allow us to create our app
app = Flask(__name__)    # Create a new instance of the Flask class called "app"
from pretend_db_response import people
# ! HEADER AT TOP OF THE SERVER

# < ROUTING ENDPOINT METHOD BLOCK => START
@app.route('/')          # The "@" decorator associates this route with the function immediately following
def hello_world():
  return 'Hello World!'  # Return the string 'Hello World!' as a response
# < ROUTING ENDPOINT METHOD BLOCK => END

@app.route('/liftoff')
def liftoff():
  return 'HOUSTON WE HAVE LIFTOFF'

@app.route('/<name_input>')
def string_variable(name_input):
  return f'{name_input} WE HAVE LIFTOFF'

@app.route('/<name_input>/<int:countdown>')
def int_variable(name_input, countdown):
  return f'{countdown}.... {name_input} WE HAVE LIFTOFF'

@app.route('/template/<int:countdown>')
def template(countdown):
  actions = ['flying...','flying...','flying...','flying...','flying...',]
  
  return render_template('index.html', 
    unicorn = countdown, 
    actions = actions,
    event = False,
    observation = "Houston, we have a problem"
  )

@app.route('/list')
def lists_template():
  random_numbers = [2,43,7,-4,67,4,64356,3456745,346]
  return render_template('lists.html',
    random_numbers = random_numbers,
    all_people = people
    )


# ! FOOTER BOPTTOM OF SERVER
# ! BELOW EVER THING EVERY TIME
if __name__=="__main__":   # Ensure this file is being run directly and not from a different module    
    app.run(debug=True, port=5001)    # Run the app in debug mode.