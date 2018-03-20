require_relative '../support/simple_migration'

class Original < Support::SimpleMigration
  def self.statements
    [
      'DROP KEYSPACE IF EXISTS xadf',
      "CREATE KEYSPACE xadf WITH REPLICATION =  { 'class' : 'SimpleStrategy', 'replication_factor' : 1 }",
      'CREATE TABLE xadf.when_keys (section text, key text, PRIMARY KEY (section, key))',
      'CREATE TABLE xadf.whens (section text, key text, op text, val text, rule_id text, PRIMARY KEY (rule_id, section, key))',
      'CREATE TABLE xadf.effective (country text, region text, timezone text, starts timestamp, ends timestamp, party text, rule_id text, PRIMARY KEY (rule_id))',
      'CREATE TABLE xadf.envelopes (document_id text, party text, country text, region text, timezone text, issued timestamp, PRIMARY KEY (document_id, party))',
    ]
  end
end