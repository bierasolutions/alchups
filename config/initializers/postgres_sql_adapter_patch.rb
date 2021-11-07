# Patch to the error:
# 2021-11-07T17:40:34.738372+00:00 app[web.1]: PG::InvalidParameterValue: ERROR:  invalid value for parameter "client_min_messages": "panic"
# 2021-11-07T17:40:34.738373+00:00 app[web.1]: HINT:  Available values: debug5, debug4, debug3, debug2, debug1, log, notice, warning, error.
# 2021-11-07T17:40:34.738375+00:00 app[web.1]: : SET client_min_messages TO 'panic'
# https://stackoverflow.com/posts/59331868/revisions

require 'active_record/connection_adapters/postgresql_adapter'

class ActiveRecord::ConnectionAdapters::PostgreSQLAdapter
  def set_standard_conforming_strings
    old, self.client_min_messages = client_min_messages, 'warning'
    execute('SET standard_conforming_strings = on', 'SCHEMA') rescue nil
  ensure
    self.client_min_messages = old
  end
end
