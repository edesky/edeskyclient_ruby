Ruby klient pro edesky.cz API
============================

**Ve vývoji.**

Informace o obecném HTTP API najdete na https://github.com/edesky/edesky_api

Příklad použití
---------------

```bash
gem install edesky-client
```

```ruby
require 'edesky_client'

client = EdeskyClient.new(api_key: '')

response = client.query_documents(keywords: 'prodej')

# vypsat prvni nalezeny dokument
p response['documents'][0]['document'][0]
```

Přehled možných parametrů hledání najdete na
https://github.com/edesky/edesky_api/blob/master/apiary.apib
