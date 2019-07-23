require 'spec_helper'

class TestResource
  extend Pina::Resource

  paginate per_page: 25
  resource_methods :where, :find
end

class NoMethodsResource
  extend Pina::Resource

  resource_methods nil
end

class ResourceWithUnknownMethod
  extend Pina::Resource

  resource_methods :delete, :update, :unknown_method
end

class ResourceWithAllMethods
  extend Pina::Resource

  resource_methods :where, :find, :update, :delete, :create
end

describe Pina::Resource do
  describe '.resource_methods' do
    it 'defines given methods' do
      expect(TestResource).to respond_to(:all, :where, :find)
    end

    it 'does not define other methods' do
      expect(TestResource).not_to respond_to(:update, :delete)
    end

    context 'when unknown resource method given' do
      it 'ignores unknown method' do
        expect(ResourceWithUnknownMethod).not_to respond_to(:unknown_method)
      end

      it 'defines known methods' do
        expect(ResourceWithUnknownMethod).to respond_to(:delete, :update)
      end
    end

    context 'when nothing given' do
      it 'does not respond to anything' do
        expect(NoMethodsResource).not_to respond_to(:all, :where, :find, :delete, :update)
      end
    end
  end

  describe '.paginate' do
    it 'sets per_page explicitly' do
      expect(TestResource.per_page).to be 25
    end
  end

  describe '.per_page' do
    context 'when explicitly sets' do
      it 'returns set per_page' do
        expect(TestResource.per_page).to be 25
      end
    end

    context 'when Pina default_per_page is configured' do
      before do
        Pina.configuration.default_per_page = 100
      end

      after do
        Pina.configuration.default_per_page = nil
      end

      it 'returns default per page' do
        expect(ResourceWithUnknownMethod.per_page).to eq Pina.configuration.default_per_page
      end
    end

    context 'when not set explicitly neither from pina configuration' do
      it 'returns nothing' do
        expect(ResourceWithUnknownMethod.per_page).to be_nil
      end
    end
  end

  describe '.find' do
    let(:response) { instance_double(Pina::RestAdapter::Response) }
    let(:model_klass) { double }
    let(:model) { double }

    before do
      allow(Pina::RestAdapter)
        .to receive(:get).with('resource_with_all_methods', 1).and_return(response)
      allow(response).to receive(:to_hash).and_return({})
      allow(Object)
        .to receive(:const_get)
        .with('Pina::Models::ResourceWithAllMethods')
        .and_return(model_klass)
      allow(model_klass)
        .to receive(:new).with(response: response).and_return(model)
    end

    context 'when successful response' do
      before do
        allow(response).to receive(:ok?).and_return(true)
      end

      it 'calls RestAdapter' do
        ResourceWithAllMethods.find(1)

        expect(Pina::RestAdapter)
          .to have_received(:get).with('resource_with_all_methods', 1)
      end

      it 'converts response to hash of attributes' do
        ResourceWithAllMethods.find(1)

        expect(response).to have_received(:to_hash)
      end

      it 'instantiates new model with given params' do
        ResourceWithAllMethods.find(1)

        expect(model_klass).to have_received(:new).with(response: response)
      end

      it 'gets model class' do
        ResourceWithAllMethods.find(1)

        expect(Object)
          .to have_received(:const_get)
          .with('Pina::Models::ResourceWithAllMethods')
      end

      it 'returns model' do
        expect(ResourceWithAllMethods.find(1)).to be model
      end
    end

    context 'when response not successful' do
      before do
        allow(response).to receive(:ok?).and_return(false)
      end

      it 'calls RestAdapter' do
        ResourceWithAllMethods.find(1)

        expect(Pina::RestAdapter)
          .to have_received(:get).with('resource_with_all_methods', 1)
      end

      it 'does not convert response to hash of attributes' do
        ResourceWithAllMethods.find(1)

        expect(response).not_to have_received(:to_hash)
      end

      it 'does not instantiate new model' do
        ResourceWithAllMethods.find(1)

        expect(model_klass).not_to have_received(:new)
      end

      it 'does not get model class' do
        ResourceWithAllMethods.find(1)

        expect(Object).not_to have_received(:const_get)
      end

      it 'returns response' do
        expect(ResourceWithAllMethods.find(1)).to be response
      end
    end
  end

  describe '.delete' do
    let(:response) { instance_double(Pina::RestAdapter::Response) }
    let(:model_klass) { double }
    let(:model) { double }

    before do
      allow(Pina::RestAdapter)
        .to receive(:delete).with('resource_with_all_methods', 1).and_return(response)
      allow(response).to receive(:to_hash).and_return({})
      allow(Object)
        .to receive(:const_get)
        .with('Pina::Models::ResourceWithAllMethods')
        .and_return(model_klass)
      allow(model_klass)
        .to receive(:new).with(response: response).and_return(model)
    end

    context 'when successful response' do
      before do
        allow(response).to receive(:ok?).and_return(true)
      end

      it 'calls RestAdapter' do
        ResourceWithAllMethods.delete(1)

        expect(Pina::RestAdapter)
          .to have_received(:delete).with('resource_with_all_methods', 1)
      end

      it 'converts response to hash of attributes' do
        ResourceWithAllMethods.delete(1)

        expect(response).to have_received(:to_hash)
      end

      it 'instantiates new model with given params' do
        ResourceWithAllMethods.delete(1)

        expect(model_klass).to have_received(:new).with(response: response)
      end

      it 'gets model class' do
        ResourceWithAllMethods.delete(1)

        expect(Object)
          .to have_received(:const_get)
          .with('Pina::Models::ResourceWithAllMethods')
      end

      it 'returns model' do
        expect(ResourceWithAllMethods.delete(1)).to be model
      end
    end

    context 'when response not successful' do
      before do
        allow(response).to receive(:ok?).and_return(false)
      end

      it 'calls RestAdapter' do
        ResourceWithAllMethods.delete(1)

        expect(Pina::RestAdapter)
          .to have_received(:delete).with('resource_with_all_methods', 1)
      end

      it 'does not convert response to hash of attributes' do
        ResourceWithAllMethods.delete(1)

        expect(response).not_to have_received(:to_hash)
      end

      it 'does not instantiate new model' do
        ResourceWithAllMethods.delete(1)

        expect(model_klass).not_to have_received(:new)
      end

      it 'does not get model class' do
        ResourceWithAllMethods.delete(1)

        expect(Object).not_to have_received(:const_get)
      end

      it 'returns response' do
        expect(ResourceWithAllMethods.delete(1)).to be response
      end
    end
  end

  describe '.create' do
    let(:response) { instance_double(Pina::RestAdapter::Response) }
    let(:model_klass) { double }
    let(:model) { double }

    before do
      allow(Pina::RestAdapter)
        .to receive(:post).with('resource_with_all_methods', model).and_return(response)
      allow(response).to receive(:to_hash).and_return({})
      allow(Object)
        .to receive(:const_get)
        .with('Pina::Models::ResourceWithAllMethods')
        .and_return(model_klass)
      allow(model_klass)
        .to receive(:new).with(response: response).and_return(model)
    end

    context 'when successful response' do
      before do
        allow(response).to receive(:ok?).and_return(true)
      end

      it 'calls RestAdapter' do
        ResourceWithAllMethods.create(model)

        expect(Pina::RestAdapter)
          .to have_received(:post).with('resource_with_all_methods', model)
      end

      it 'converts response to hash of attributes' do
        ResourceWithAllMethods.create(model)

        expect(response).to have_received(:to_hash)
      end

      it 'instantiates new model with given params' do
        ResourceWithAllMethods.create(model)

        expect(model_klass).to have_received(:new).with(response: response)
      end

      it 'gets model class' do
        ResourceWithAllMethods.create(model)

        expect(Object)
          .to have_received(:const_get)
          .with('Pina::Models::ResourceWithAllMethods')
      end

      it 'returns model' do
        expect(ResourceWithAllMethods.create(model)).to be model
      end
    end

    context 'when response not successful' do
      before do
        allow(response).to receive(:ok?).and_return(false)
      end

      it 'calls RestAdapter' do
        ResourceWithAllMethods.create(model)

        expect(Pina::RestAdapter)
          .to have_received(:post).with('resource_with_all_methods', model)
      end

      it 'does not convert response to hash of attributes' do
        ResourceWithAllMethods.create(model)

        expect(response).not_to have_received(:to_hash)
      end

      it 'does not instantiate new model' do
        ResourceWithAllMethods.create(model)

        expect(model_klass).not_to have_received(:new)
      end

      it 'does not get model class' do
        ResourceWithAllMethods.create(model)

        expect(Object).not_to have_received(:const_get)
      end

      it 'returns response' do
        expect(ResourceWithAllMethods.create(model)).to be response
      end
    end
  end

  describe '.update' do
    let(:response) { instance_double(Pina::RestAdapter::Response) }
    let(:model_klass) { double }
    let(:model) { double }

    before do
      allow(Pina::RestAdapter)
        .to receive(:patch)
        .with('resource_with_all_methods', 1, model).and_return(response)
      allow(response).to receive(:to_hash).and_return({})
      allow(Object)
        .to receive(:const_get)
        .with('Pina::Models::ResourceWithAllMethods')
        .and_return(model_klass)
      allow(model_klass)
        .to receive(:new).with(response: response).and_return(model)
    end

    context 'when successful response' do
      before do
        allow(response).to receive(:ok?).and_return(true)
      end

      it 'calls RestAdapter' do
        ResourceWithAllMethods.update(1, model)

        expect(Pina::RestAdapter)
          .to have_received(:patch)
          .with('resource_with_all_methods', 1, model)
      end

      it 'converts response to hash of attributes' do
        ResourceWithAllMethods.update(1, model)

        expect(response).to have_received(:to_hash)
      end

      it 'instantiates new model with given params' do
        ResourceWithAllMethods.update(1, model)

        expect(model_klass).to have_received(:new).with(response: response)
      end

      it 'gets model class' do
        ResourceWithAllMethods.update(1, model)

        expect(Object)
          .to have_received(:const_get)
          .with('Pina::Models::ResourceWithAllMethods')
      end

      it 'returns model' do
        expect(ResourceWithAllMethods.update(1, model)).to be model
      end
    end

    context 'when response not successful' do
      before do
        allow(response).to receive(:ok?).and_return(false)
      end

      it 'calls RestAdapter' do
        ResourceWithAllMethods.update(1, model)

        expect(Pina::RestAdapter)
          .to have_received(:patch).with('resource_with_all_methods', 1, model)
      end

      it 'does not convert response to hash of attributes' do
        ResourceWithAllMethods.update(1, model)

        expect(response).not_to have_received(:to_hash)
      end

      it 'does not instantiate new model' do
        ResourceWithAllMethods.update(1, model)

        expect(model_klass).not_to have_received(:new)
      end

      it 'does not get model class' do
        ResourceWithAllMethods.update(1, model)

        expect(Object).not_to have_received(:const_get)
      end

      it 'returns response' do
        expect(ResourceWithAllMethods.update(1, model)).to be response
      end
    end
  end

  describe '.all' do
    let(:response) { instance_double(Pina::RestAdapter::Response) }
    let(:collection_klass) { double }
    let(:collection) { double }

    before do
      allow(Pina::RestAdapter)
        .to receive(:get).with('resource_with_all_methods', {}).and_return(response)
      allow(response).to receive(:to_hash).and_return({})
      allow(Object)
        .to receive(:const_get)
        .with('Pina::Collections::ResourceWithAllMethods')
        .and_return(collection_klass)
      allow(collection_klass)
        .to receive(:new).with(response: response).and_return(collection)
    end

    context 'when successful response' do
      before do
        allow(response).to receive(:ok?).and_return(true)
      end

      it 'calls RestAdapter' do
        ResourceWithAllMethods.all

        expect(Pina::RestAdapter).to have_received(:get)
      end

      it 'converts response to hash of attributes' do
        ResourceWithAllMethods.all

        expect(response).to have_received(:to_hash)
      end

      it 'instantiates new collection with given params' do
        ResourceWithAllMethods.all

        expect(collection_klass).to have_received(:new).with(response: response)
      end

      it 'gets collection class' do
        ResourceWithAllMethods.all

        expect(Object)
          .to have_received(:const_get)
          .with('Pina::Collections::ResourceWithAllMethods')
      end

      it 'returns collection' do
        expect(ResourceWithAllMethods.all).to be collection
      end
    end

    context 'when response not successful' do
      before do
        allow(response).to receive(:ok?).and_return(false)
      end

      it 'calls RestAdapter' do
        ResourceWithAllMethods.all

        expect(Pina::RestAdapter).to have_received(:get)
      end

      it 'does not convert response to hash of attributes' do
        ResourceWithAllMethods.all

        expect(response).not_to have_received(:to_hash)
      end

      it 'does not instantiate new collection' do
        ResourceWithAllMethods.all

        expect(collection_klass).not_to have_received(:new)
      end

      it 'does not get collection class' do
        ResourceWithAllMethods.all

        expect(Object).not_to have_received(:const_get)
      end

      it 'returns response' do
        expect(ResourceWithAllMethods.all).to be response
      end
    end

    context 'when per_page is set' do
      before do
        Pina.configuration.default_per_page = 100

        allow(Pina::RestAdapter)
          .to receive(:get)
          .with('resource_with_all_methods', per_page: 100)
          .and_return(response)
        allow(response).to receive(:ok?).and_return(false)
      end

      after do
        Pina.configuration.default_per_page = nil
      end

      it 'calls RestAdapter with per_page param' do
        ResourceWithAllMethods.all

        expect(Pina::RestAdapter)
          .to have_received(:get).with('resource_with_all_methods', per_page: 100)
      end
    end
  end
end
