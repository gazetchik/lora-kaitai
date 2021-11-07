meta:
  id: vega_hs0101
  file-extension: vega_hs0101
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
    - id: raw_unixtime
      type: u4le
    - id: raw_temperature
      type: s2le
    - id: raw_humidity
      type: u1
    - id: raw_sensor_status1
      type: u1
    - id: raw_sensor_status2
      type: u1
    - id: raw_angle
      type: u1
    - id: raw_humidity_min
      type: u1
    - id: raw_humidity_max
      type: u1
    - id: raw_temperature_min
      type: u1
    - id: raw_temperature_max
      type: u1
    instances:
      input1:
        value: raw_sensor_status1 == 1
      input2:
        value: raw_sensor_status2 == 1
      angle:
        value: raw_angle
      battery:
        value: raw_battery
      temperature:
        value: 'raw_temperature * 0.1'
      humidity:
        value: raw_humidity
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