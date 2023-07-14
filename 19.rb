#!/usr/bin/env ruby

limit = ARGV[0].to_i
FIRST_JAN_1900="M"
DAYS = [
  "S",
  "M",
  "T",
  "W",
  "R",
  "F",
  "A"
]

MONTHS = {
  JAN: 31,
  FEB: 28,
  MAR: 31,
  APR: 30,
  MAY: 31,
  JUN: 30,
  JUL: 31,
  AUG: 31,
  SEP: 30,
  OCT: 31,
  NOV: 30,
  DEC: 31
}

class DateCounter
  attr_accessor :year, :month, :dom, :dow, :months, :current_months
  attr_reader :year, :month, :dom, :dow, :months

  def initialize(year, month, dom, dow)
    self.year = year
    self.month = month
    self.dom = dom
    self.dow = dow
    self.current_months = self.get_months(year)
  end

  def div_by?(x,n)
    x % n == 0
  end

  def is_century?(year)
    div_by?(year, 100)
  end

  def is_leap_year?(year)
    century_leap = (is_century?(year) && div_by?(year, 400))
    non_century_leap = (!is_century?(year) && div_by?(year, 4))
    century_leap || non_century_leap
  end

  def get_months(year)
    months = MONTHS.dup
    if is_leap_year?(year)
      months[:FEB] = 29
    end
    return months
  end

  def next_day
    at_max_dom = (self.dom == self.current_months[self.month.to_sym])
    at_max_dow = (self.dow == DAYS.last)

    if at_max_dom
      months = self.current_months.keys
      month_index = months.index(self.month.to_sym)
      new_month = months[month_index + 1]
      if new_month
        self.month = new_month
      else
        self.month = "JAN"
        self.year = self.year + 1
        self.current_months = get_months(self.year)
      end
      self.dom = 1
    else
      self.dom += 1
    end

    if at_max_dow
      self.dow = DAYS.first
    else
      self.dow = DAYS[DAYS.index(self.dow)+1]
    end
  end

  def to_s
    "#{self.year}:#{self.month}:#{self.dom}:#{self.dow}"
  end
end

def main(limit)
  dc = DateCounter.new(1900, "JAN", 1, FIRST_JAN_1900)
  dates = []
  (1..limit).each{|i|
    dates.push(dc.to_s) if dc.year > 1900
    break if dc.to_s =~ /2000:DEC:31:/
    dc.next_day
  }

  puts dates.filter{|d| d =~ /:1:S$/}.size
end

main(limit)
