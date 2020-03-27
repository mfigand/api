# frozen_string_literal: true
# rubocop:disable all

# Generate the API docs.
# You must run the following command to generate new documentation json files
# everytime you change the API endpoints:
# SD_LOG_LEVEL=1 rake swagger:docs

include Swagger::Docs::ImpotentMethods

class Swagger::Docs::Config
  def self.base_api_controller
    ActionController::API
  end
end

class Swagger::Docs::Config
  def self.transform_path(path, _api_version)
    # Make a distinction between the APIs and API documentation paths.
    "apidocs/#{path}"
  end
end

Swagger::Docs::Config.register_apis({
                                      '1.0' => {
                                        # the extension used for the API
                                        api_extension_type: :json,
                                        # the output location where your .json files are written to
                                        api_file_path: 'public/apidocs',
                                        # the URL base path to your API
                                        base_path: 'http://localhost:3000',
                                        # if you want to delete all .json files at each generation
                                        clean_directory: false,
                                        # As we are using Rails-API, our ApplicationController inherits ActionController::API instead of ActionController::Base
                                        # Hence, we need to add ActionController::API instead of default ActionController::Base
                                        base_api_controller: ActionController::API,
                                        # Ability to setup base controller for each api version. Api::V1::SomeController for example.
                                        # :parent_controller => ApplicationController,
                                        # add custom attributes to api-docs
                                        attributes: {
                                          info: {
                                            'title' => 'Swagger FIGAND API',
                                            'description' => 'This is the FIGAND API documentation.',
                                            'termsOfServiceUrl' => 'http://helloreverb.com/terms/',
                                            'contact' => 'manuel.fig@figand.com',
                                            'license' => 'Apache 2.0',
                                            'licenseUrl' => 'http://www.apache.org/licenses/LICENSE-2.0.html'
                                          }
                                        }
                                      }
                                    })
# rubocop:enable all
