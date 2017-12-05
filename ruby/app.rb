require 'sinatra'
require 'pg'
require './processor'

# Output a table of current connections to the DB
conn = PG.connect( dbname: 'postgres', user: 'postgres', host: 'db' )
#conn.exec( "SELECT * FROM pg_stat_activity" ) do |result|
#  puts "     PID | User             | Query"
#  result.each do |row|
#    puts " %7d | %-16s | %s " %
#         row.values_at('procpid', 'usename', 'current_query')
#  end
#end

set :port, 9090
set :bind, '0.0.0.0'

use Rack::Auth::Basic, "Restricted Area" do |username, password|
  username == '123admin' and password == '123admin'
end

get '/' do
  "Hello there, over SSL"
end

post '/api/incoming' do
  request.body.rewind
  body = request.body.read
  p = Processor.new( body )
  stmt = "stmt_#{(rand()*10000).to_s}"
  conn.prepare(stmt, "insert into core_feeding (\"start\", \"end\", type, method ,amount,child_id) values( now(), now(), 'bottle', 'formula', $1, 1 );" )
  result = conn.exec_prepared(stmt, [ p.amount ] )
  logger.info result.inspect
end

post '/api/:table' do |t|
  conn.exec( "select * from core_feeding" )  do |result|
    result[0].to_s
  end
end
