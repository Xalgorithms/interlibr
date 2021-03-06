require_relative '../support/simple_migration'

class Original < Support::SimpleMigration
  def self.statements
    [
      'DROP KEYSPACE IF EXISTS interlibr',
      "CREATE KEYSPACE interlibr WITH REPLICATION =  { 'class' : 'SimpleStrategy', 'replication_factor' : 1 }",
      'CREATE TABLE interlibr.when_keys (section text, key text, refs counter, PRIMARY KEY (section, key))',
      'CREATE TABLE interlibr.whens (section text, key text, op text, val text, rule_id text, PRIMARY KEY (rule_id, section, key))',
      'CREATE TABLE interlibr.effective (country text, region text, timezone text, starts timestamp, ends timestamp, key text, rule_id text, PRIMARY KEY (rule_id, country, region, key))',
    ]
  end
end
