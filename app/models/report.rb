require 'query'

class Report < ActiveRecord::Base
  belongs_to :job
  serialize :state_ids

  def query(job, keyword, keyword_index)
    result = GoogleSearchQuery.new(keyword)
    result.query
    params = {
      :keyword => keyword,
      :keyword_index => keyword_index,
      :top_adword_url => result.total_adword,
      :right_adword_url => result.right_adword,
      :none_adword_url => result.none_adword,
      :top_adword => result.top_adword.length,
      :right_adword => result.right_adword.length,
      :total_adword => result.total_adword.length,
      :none_adword => result.none_adword.length,
      :total_search => result.total_search_result,
      :page => result.page,
      :job_id => job.id
    }
    self.attributes = params
    self.save
  end
end
