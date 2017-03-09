shared_examples 'resource' do |_response_class|
  describe 'new' do
    it 'initializes new contact' do
      expect(described_class.new).to be_a subject.class
    end
  end

  describe 'find' do
    context 'valid id' do
      it 'returns contact object' do
        VCR.use_cassette "#{subject.class}_find" do
          expect(described_class.find(valid_id)).to be_a subject.class
        end
      end
    end

    context 'invalid id' do
      it 'returns response object' do
        VCR.use_cassette "#{subject.class}_find_invalid" do
          expect(described_class.find(invalid_id))
            .to be_a Pina::RestAdapter::Response
        end
      end

      it 'returns 404 status code' do
        VCR.use_cassette "#{subject.class}_find_invalid" do
          response = described_class.find(invalid_id)
          expect(response.status_code).to eq '404'
        end
      end
    end
  end

  describe 'create' do
    context 'valid contact' do
      it 'returns contact object' do
        VCR.use_cassette "#{subject.class}_create" do
          expect(described_class.create(resource)).to be_a subject.class
        end
      end
    end

    context 'invalid contact' do
      it 'returns response object' do
        VCR.use_cassette "#{subject.class}_create_invalid" do
          expect(described_class.create(invalid_resource))
            .to be_a Pina::RestAdapter::Response
        end
      end

      it 'returns 422 status code' do
        VCR.use_cassette "#{subject.class}_create_invalid" do
          response = described_class.create(invalid_resource)
          expect(response.status_code).to eq '422'
        end
      end
    end
  end

  describe 'update' do
    context 'valid contact' do
      it 'returns contact object' do
        VCR.use_cassette "#{subject.class}_update" do
          expect(described_class.update(valid_id, different_resource))
            .to be_a subject.class
        end
      end
    end

    context 'invalid contact' do
      it 'returns response object' do
        VCR.use_cassette "#{subject.class}_update_invalid" do
          expect(described_class.update(valid_id, invalid_resource))
            .to be_a Pina::RestAdapter::Response
        end
      end

      it 'returns 422 status code' do
        VCR.use_cassette "#{subject.class}_update_invalid" do
          response = described_class.update(valid_id, invalid_resource)
          expect(response.status_code).to eq '422'
        end
      end
    end

    context 'non-existing contact' do
      it 'returns response object' do
        VCR.use_cassette "#{subject.class}_update_nonexisting" do
          expect(described_class.update(invalid_id, resource))
            .to be_a Pina::RestAdapter::Response
        end
      end

      it 'returns 404 status code' do
        VCR.use_cassette "#{subject.class}_update_nonexisting" do
          response = described_class.update(invalid_id, resource)
          expect(response.status_code).to eq '404'
        end
      end
    end
  end
end
