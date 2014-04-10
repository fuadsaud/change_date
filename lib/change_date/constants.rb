module ChangeDate
  module Constants
    MINUTES_IN_ONE_HOUR =  60
    MINUTES_IN_ONE_DAY  =  24 * MINUTES_IN_ONE_HOUR
    MINUTES_IN_ONE_YEAR = 365 * MINUTES_IN_ONE_DAY

    MONTHS = {
       1 => 1..31,    # jan
       2 => 32..59,   # feb
       3 => 60..90,   # mar
       4 => 91..120,  # apr
       5 => 121..151, # may
       6 => 152..181, # jun
       7 => 182..212, # jul
       8 => 213..243, # aug
       9 => 244..273, # sep
      10 => 274..304, # oct
      11 => 305..334, # nov
      12 => 335..365, # dec
    }
  end
end
