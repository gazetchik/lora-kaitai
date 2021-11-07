meta:
  id: vega_si11
  file-extension: vega_si11
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
        0x02: alarm
        0xFF: time_correction
types:
  standart:
    seq:
    - id: raw_battery
      type: u1
    - id: raw_config
      type: u1
    - id: raw_unixtime
      type: u4le
    - id: raw_temperature
      type: u1
    - id: raw_exit1
      type: u4le
    - id: raw_exit2
      type: u4le
    - id: raw_exit3
      type: u4le
    - id: raw_exit4
      type: u4le
    instances:
      battery:
        value: raw_battery
      temperature:
        value: raw_temperature
      exit1:
        value: raw_exit1
      exit2:
        value: raw_exit2
      exit3:
        value: raw_exit3
      exit4:
        value: raw_exit4
  alarm:
    seq:
    - id: raw_battery
      type: u1
    - id: raw_config
      type: u1
    - id: raw_alarm_exit
      type: u1
    - id: raw_unixtime
      type: u4le
    - id: raw_exit1
      type: u4le
    - id: raw_exit2
      type: u4le
    - id: raw_exit3
      type: u4le
    - id: raw_exit4
      type: u4le
    instances:
      battery:
        value: raw_battery
      alarm_exit:
        value: raw_alarm_exit
      exit1:
        value: raw_exit1
      exit2:
        value: raw_exit2
      exit3:
        value: raw_exit3
      exit4:
        value: raw_exit4
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
    instances:
      time:
        value: raw_unixtime
