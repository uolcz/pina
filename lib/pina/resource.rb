module Pina
  module Resource
    def paginate(options = {})
      @per_page = options.fetch(:per_page)
    end

    def resource_methods(*methods)
      methods.each do |method|
        next unless method

        method_name = "define_#{method}".to_sym
        next unless respond_to?(method_name, true)

        send(method_name)
      end
    end

    def per_page
      @per_page || ::Pina.configuration.default_per_page
    end

    private

    def define_where
      define_all unless respond_to?(:all)

      singleton_class.class_eval do
        alias_method :where, :all
      end
    end

    def define_all
      define_singleton_method(:all) do |params = {}|
        params[:per_page] = per_page if per_page

        response = Pina::RestAdapter.get(resource_path, params)

        return collection.new(attributes(response)) if response.ok?

        response
      end
    end

    def define_find
      define_singleton_method(:find) do |id|
        response = Pina::RestAdapter.get(resource_path, id)

        return model.new(attributes(response)) if response.ok?

        response
      end
    end

    def define_create
      define_singleton_method(:create) do |entity|
        response = Pina::RestAdapter.post(resource_path, entity)

        return model.new(attributes(response)) if response.ok?

        response
      end
    end

    def define_update
      define_singleton_method(:update) do |id, entity|
        response = Pina::RestAdapter.patch(resource_path, id, entity)

        return model.new(attributes(response)) if response.ok?

        response
      end
    end

    def define_delete
      define_singleton_method(:delete) do |id|
        response = Pina::RestAdapter.delete(resource_path, id)

        return model.new(attributes(response)) if response.ok?

        response
      end
    end

    def resource_name
      name.demodulize
    end

    def resource_path
      resource_name.underscore.pluralize
    end

    def collection
      Object.const_get("Pina::Collections::#{resource_name}")
    end

    def model
      Object.const_get("Pina::Models::#{resource_name}")
    end

    def attributes(response)
      response.to_hash.merge(response: response)
    end
  end
end
