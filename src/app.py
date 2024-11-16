from flask import Flask, redirect, render_template, request
from counter import Counter

app = Flask(__name__)
cnt = Counter()

@app.route("/")
def index():
    return render_template("index.html", value=cnt.value)

@app.route("/increment", methods=["POST"])
def increment():
    cnt.increase()
    return redirect("/")

@app.route("/reset", methods=["POST"])
def reset():
    cnt.reset()
    return redirect("/")

@app.route("/set", methods=["GET","POST"])
def set():
    if request.method == 'POST':
        value=request.form['value']
        try:
            if(value==''):
                value=0
            else:
                value=int(value)
            cnt.set_value(value)
            return redirect("/")
        except ValueError:
            return redirect("/")
    return redirect("/")