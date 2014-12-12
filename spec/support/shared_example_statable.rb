shared_examples 'statable' do
  let(:model) { described_class }

  before(:each) do
    FactoryGirl.create(model, date: DateTime.new(2011, 1, 1), date_added: DateTime.new(1999, 2, 2), size: 23_200)
    FactoryGirl.create(model, date: DateTime.new(2014, 1, 1), date_added: DateTime.new(1776, 6, 5), size: nil)
    FactoryGirl.create(model, date: nil, date_added: nil, size: 211_210)
    FactoryGirl.create(model, date: DateTime.new(2014, 1, 1), date_added: DateTime.new(1776, 6, 5), size: 23_221)
  end

  describe '.total_size' do
    subject { model.total_size }
    it 'should work' do
      expect(subject).to eq(257_631)
    end
  end

  describe '.average_age' do
    subject { model.average_age }
    it 'should work' do
      expect(subject).to eq(59_298)
    end
  end

  describe '.average_size' do
    subject { model.average_size }
    it 'should work' do
      expect(subject).to eq(85)
    end
  end

  describe '.maximum_age' do
    subject { model.maximum_age }
    it 'should work' do
      expect(subject).to eq(86_772)
    end
  end

  describe '.minimum_age' do
    subject { model.minimum_age }
    it 'should work' do
      expect(subject).to eq(4351)
    end
  end

  describe '.minimum_size' do
    subject { model.minimum_size }
    it 'should work' do
      expect(subject).to eq(23)
    end
  end

  describe '.maximum_size' do
    subject { model.maximum_size }
    it 'should work' do
      expect(subject).to eq(211)
    end
  end
end
