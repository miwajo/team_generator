json.array!(@teams) do |team|
  json.extract! team, :id, :student_id, :is_leader, :team_id
  json.url team_url(team, format: :json)
end
