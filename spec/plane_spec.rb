require_relative "../lib/plane"

describe Plane do
 
  let(:plane) { Plane.new }
  
  it 'has a flying status when created' do
  	expect(plane.status).to eq('flying')
  end
  
  it 'can take off' do
  	plane.land
  	expect(plane.status).to eq('landed')
  end
  
  it 'changes its status to flying after taking of' do
  	plane.land
  	plane.take_off
  	expect(plane.status).to eq('flying')
  end

end