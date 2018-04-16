Mime::Type.register('application/vnd.api+json', :jsonapi)
ActionDispatch::Request.parameter_parsers[:jsonapi] = ActionDispatch::Request.parameter_parsers[:json]