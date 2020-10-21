# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?
  execute(<<-SQL)
    SELECT
      DISTINCT nobels.yr
    FROM
      nobels
    WHERE
      nobels.subject ='Physics' AND yr NOT IN(
        SELECT yr
        FROM nobels
        where nobels.subject ='Chemistry')
  SQL
end

#JOIN nobels AS nobel
# on nobels.yr = nobel.yr
