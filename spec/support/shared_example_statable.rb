shared_examples 'statable' do
  let(:model) { described_class }

  describe '.minimum_size' do
    context "when some object doesn't have a size" do
      let(:size) { 23_200 }
      before(:each) do
        FactoryGirl.create(model, size: nil)
        FactoryGirl.create(model, size: size)
      end
      it 'should not affect the calculation' do
        expect(model.minimum_size).to eq(23)
      end
    end
  end

  describe '.average_age' do
    it 'should work' do
      FactoryGirl.create(model, date: DateTime.new(2011, 1, 1), date_added: DateTime.new(1999, 2, 2))
      FactoryGirl.create(model, date: DateTime.new(2014, 1, 1), date_added: DateTime.new(1776, 6, 5))
      expect(model.average_age).to eq(45_561)
    end
  end
end
