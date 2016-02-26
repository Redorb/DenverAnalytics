module ComplaintsHelper
  # Because of the weird and annoying way that active record
  # returns groupings with the group collection set as a the
  # key and the count as its value I have to massage the data to make
  # it look sane for the front end.
  # Example transformation:
  #     ["2014-08-29", "10 Min. Grace"]: 2,
  #     ["2014-08-29", "311 - General Inquiry"]: 49,
  #     ["2014-08-29", "311 Compliment"]: 1,
  #  =>
  # 10 Min. Grace: {
  #     2014-08: 2,
  #     2014-09: 17,
  #     2014-10: 17,
  #     2014-11: 11,
  #
  # So the below set groups the set on date first and then fixes the resulting
  # pairing in the newly created hash map of dates. Multiple groups are concatenated
  # with | to create a unique hash
  def self.transform_date_group_queries(complaints)
    compressed_topics_key_hash = {}
    complaints.each { |k, v|
      date = k[0]
      topic_key = k[1..-1].join('|')
      count = v
      compressed_topics_key_hash[topic_key] ||= {}
      compressed_topics_key_hash[topic_key][date] = count
    }
    compressed_topics_key_hash
  end
end
