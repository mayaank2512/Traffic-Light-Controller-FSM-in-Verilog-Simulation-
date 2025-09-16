import tkinter as tk
import time

root = tk.Tk()
root.title("🚦 Traffic Light Controller Simulation")

canvas = tk.Canvas(root, width=400, height=300, bg="black")
canvas.pack()

# Draw traffic lights (rectangles)
NS_light = canvas.create_oval(50, 50, 100, 100, fill="red")
EW_light = canvas.create_oval(250, 50, 300, 100, fill="red")

def set_light(ns, ew):
    colors = { "R": "red", "Y": "yellow", "G": "green" }
    canvas.itemconfig(NS_light, fill=colors[ns])
    canvas.itemconfig(EW_light, fill=colors[ew])
    root.update()

def run_simulation():
    while True:
        # NS Green, EW Red
        set_light("G", "R")
        time.sleep(5)

        # NS Yellow, EW Red
        set_light("Y", "R")
        time.sleep(2)

        # NS Red, EW Green
        set_light("R", "G")
        time.sleep(5)

        # NS Red, EW Yellow
        set_light("R", "Y")
        time.sleep(2)

btn = tk.Button(root, text="▶ Start Simulation", command=lambda: run_simulation())
btn.pack(pady=20)

root.mainloop()
