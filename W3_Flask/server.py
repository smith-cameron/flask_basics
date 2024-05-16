from flask import Flask
app = Flask(__name__)
# ^ HEADER OF SERVER ^

# < ROUTE BODY START
@app.route('/index')
def index():
  return "Houston we have liftoff!!!!!"
# < ROUTE BODY END

# ! FOOTER/BOTTOM OF SERVER
# ^ BELOW EVERY ROUTE... EVERY TIME
if __name__ == "__main__":
  app.run(debug=True, Port=5500)