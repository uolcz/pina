require 'spec_helper'

class AnyCollection
  include Pina::Utils::Pagination

  def items
    [1]
  end

  def _meta
    {
      'pagination' => {
        'first' => 'http://test.ucetnictvi.uol.cz/api/v1/contacts?page=1',
        'next' => 'http://test.ucetnictvi.uol.cz/api/v1/contacts?page=3',
        'last' => 'http://test.ucetnictvi.uol.cz/api/v1/contacts?page=4',
        'previous' => 'http://test.ucetnictvi.uol.cz/api/v1/contacts?page=1'
      }
    }
  end
end

describe Pina::Utils::Pagination do
  let(:resource) { double }
  let(:subject) { AnyCollection.new }

  before do
    allow(Object)
      .to receive(:const_get)
      .with('Pina::AnyCollection')
      .and_return(resource)
    allow(resource).to receive(:all)
  end

  describe '#paginate' do
    context 'when page param present in url' do
      it 'calls resource with extracted params from url' do
        url = 'http://example.com/api/v1/contacts?page=3&per_page=25&seller=test'

        subject.paginate(url)

        expect(resource)
          .to have_received(:all)
          .with('page' => '3', 'per_page' => '25', 'seller' => 'test')
      end
    end

    context 'when page param not given' do
      it 'returns nil' do
        expect(subject.paginate('http://test.ucetnictvi.uol.cz/api/v1/contacts')).to be_nil
      end

      it 'does not call resource' do
        subject.paginate('http://test.ucetnictvi.uol.cz/api/v1/contacts')

        expect(resource).not_to have_received(:all)
      end
    end
  end

  %i[next_page previous_page last_page].each do |method|
    describe "##{method}" do
      before do
        allow(subject).to receive(:paginate)
      end

      it 'calls paginate method with correct url' do
        subject.public_send(method)

        link = method.to_s.gsub('_page', '')

        expect(subject)
          .to have_received(:paginate)
          .with(subject._meta['pagination'][link])
      end
    end
  end

  describe '#collect_items' do
    before do
      allow(subject).to receive(:next_page).and_return(subject, subject, nil)
    end

    it 'iterates over next_page' do
      subject.collect_items

      expect(subject).to have_received(:next_page).exactly(3).times
    end

    it 'returns collected items' do
      expect(subject.collect_items).to eq [1, 1, 1]
    end
  end
end
