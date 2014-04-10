module ChangeDate
  module Constants
    MINUTES_IN_ONE_HOUR =  60
    MINUTES_IN_ONE_DAY  =  24 * MINUTES_IN_ONE_HOUR
    MINUTES_IN_ONE_YEAR = 365 * MINUTES_IN_ONE_DAY

    MONTHS = {
       1 => 0..30,    # jan
       2 => 31..58,   # feb
       3 => 59..89,   # mar
       4 => 90..119,  # apr
       5 => 120..150, # may
       6 => 151..180, # jun
       7 => 181..211, # jul
       8 => 212..242, # aug
       9 => 243..272, # sep
      10 => 273..303, # oct
      11 => 304..333, # nov
      12 => 334..364, # dec
    }
  end
end
