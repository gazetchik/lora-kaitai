meta:
  id: vega_td11
  file-extension: vega_td11
  endian: le  
seq:
  - id: fport
    type: u1
  - id: raw_message_type
    type: u1
  - id: data
    type:
      switch-on: raw_message_type
      cases:
        0x00: config
        0x01: standart
        0xFF: time_correction
types:
  standart:
    seq:
    - id: raw_battery
      type: u1
    - id: raw_limit
      type: u1
    - id: raw_unixtime
      type: u4le
    - id: raw_temperature
      type: s2le
    - id: raw_temperature_min
      type: u1
    - id: raw_temperature_max
      type: u1
    - id: raw_cause
      type: u1
      enum: name_status
    - id: raw_input_status
      type: u1
    instances:
      battery:
        value: raw_battery
      temperature:
        value: 'raw_temperature * 0.1'
      limit:
        value: raw_limit == 0
      package_status:
        value: raw_cause
  config:
    seq:
    - id: parameters
      type: parameters_struct
      repeat: eos
    types:
      parameters_struct:
        seq:
        - id: id
          type: u2le
        - id: len
          type: u1
        - id: value
          size: len
  time_correction:
    seq:
    - id: raw_unixtime
      type: u4le
enums:
  name_status:
    0: time
    1: alarm
    2: open
    3: holl1
    4: holl2
    5: temp_limit