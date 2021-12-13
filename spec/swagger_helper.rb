require 'rails_helper'

RSpec.configure do |config|
  config.swagger_root = Rails.root.join('swagger').to_s

  config.swagger_docs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'API V1',
        version: 'v1'
      },
      servers: [
        {
          url: '{protocol}://{defaultHost}',
          variables: {
            defaultHost: {
              default: 'polar-island-18380.herokuapp.com'
            },
            protocol: {
              default: 'https'
            }
          }
        }
      ],
      components: {
        securitySchemes: {
          Bearer: { type: 'apiKey', name: 'Authorization', in: 'header',
                    description: 'JWT key necessary for protected API calls' }
        }
      }
    }
  }

  config.swagger_format = :yaml
end
