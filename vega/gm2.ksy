meta:
  id: vega_gm2
  file-extension: vega_gm2
  endian: le
seq:
  - id: fport
    type: u1
  - id: raw_battery
    type: u1
  - id: raw_unixtime
    type: u4le
  - id: raw_temperature
    type: u1
  - id: raw_cause
    type: u1
  - id: raw_state_input1
    type: u1
  - id: raw_state_input2
    type: u1
  - id: raw_state_exit1
    type: u1
  - id: raw_state_exit2
    type: u1
  - id: raw_alarm_magnit1
    type: u1
  - id: raw_alarm_open1
    type: u1
  - id: raw_gas_expense
    type: u4le
  - id: raw_gas_start
    type: u4le
instances:
  battery:
    value: raw_battery
  temperature:
    value: raw_temperature
  cause:
    value: raw_cause
  input1:
    value: raw_state_input1 == 0
  input2:
    value: raw_state_input2 == 0
  exit1:
    value: raw_state_exit1 == 0
  exit2:
    value: raw_state_exit2 == 0
  indication:
    value: '(raw_gas_expense - raw_gas_start) * 0.01'