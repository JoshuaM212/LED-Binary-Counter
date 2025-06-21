# 🔢 LED Binary Counter – FPGA (RealDigital Blackboard)

This project implements an 8-bit binary counter on the RealDigital Xilinx Blackboard FPGA board. The design uses a clock divider module to slow the 100 MHz base clock to approximately the desired clock rate (1 Hz shown in the project), which then drives a synchronous counter. The counter output is displayed on the 8 on-board LEDs, allowing the counter to be visual.

---

## 📦 Project Structure

- top.sv
  - clk_divider.sv
  - LED_counter.sv
  
---

## 🔧 Features

- 8-bit synchronous binary counter  
- 100 MHz input clock divided down to ~1 Hz
- LED display of counter value in binary  
- Modular Verilog design with reusable components  
- Synthesizable on Xilinx Vivado for RealDigital Blackboard

---

## 💡 How It Works

### `clk_divider.v`  
Reduces the base 100 MHz clock to the desired Hz rate by counting cycles. Uses a 26-bit register for division as its the minimum value that can hold the base value.

### `counter.v`  
A synchronous 8-bit binary up-counter. Increments on every rising edge of the divided clock. Due to this incrementing, the desired clock rate is divided in half, to meet our expected outcome.

### `top.v`  
Connects the on-board 100 MHz clock and LEDs to the internal logic modules. Maps ports to physical pins via the constraint file.

---

## 🧪 Simulation

You can simulate the counter logic with a testbench to verify correctness before synthesis.

---

## 🛠 Tools Used

- Xilinx Vivado (2020.2 or later)
- RealDigital Xilinx Blackboard FPGA

---

## 🚀 How to Run

1. Open `top.v` in Vivado and create a project targeting the RealDigital Blackboard.
2. Add all `.v` files from the `src/` folder.
3. Apply pin constraints from `blackboard.xdc`.
4. Synthesize, implement, and program to the board.

---

## 📜 License

MIT

---

## 📫 Author

**Joshua Martinez**  
[LinkedIn](https://www.linkedin.com/in/joshua-martinez-b32238346/)  
[martinezjoshu212@gmail.com](mailto:martinezjoshu212@gmail.com)
