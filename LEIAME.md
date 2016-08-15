# ValidateCnpj

To read this documentation in English click [here](https://github.com/RamonHossein/validate_cnpj/blob/master/README.md).

Adiciona suporte a validação do CNPJ para Rails (ActiveModel) testando de uma forma simples.

## Instalação

Adicione esta linha ao Gemfile de sua aplicação:

```ruby
gem 'validate_cnpj'
```

E então execute:

    $ bundle

Ou instale ele próprio como:

    $ gem install validate_cnpj

## Uso

Basta usar como qualquer outro validador:

```ruby
class User < ActiveRecord::Base
    validates :cnpj, cnpj: true
end
```

## Mensagem de erro

Se você precisar localizar a mensagem de erro, basta adicioná-la ao seu arquivo I18n locale:

```ruby
errors:
  messages:
    this_document_is_invalid: "Este documento é invalido"
```

Você pode fornecer sua própria mensagem usando: opção de mensagem.

```ruby
validates :cnpj, cnpj: {message: "nova mensagem de erro"}
```

## Mantido por:
[RamonHossein](https://github.com/RamonHossein)

## Contribuidores

Para ver as pessoas que têm contribuído com código, dê uma olhada na [lista de contribuintes](http://github.com/RamonHossein/validate_cnpj/contributors).

## Contribuindo

1. Fork
2. Crie sua feature branch (`git checkout -b my-new-feature`)
3. Commit suas alterações (`git commit -am 'Added some feature'`)
4. Push para a branch (`git push origin my-new-feature`)
5. Crie um novo Pull Request

# Licença

A gem está disponível como código aberto sob os termos da [MIT License](http://opensource.org/licenses/MIT).
