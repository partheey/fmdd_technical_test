require 'rspec'
require 'stringio'

RSpec.describe 'Dice Roller' do
  before do
    @input = StringIO.new
    @output = StringIO.new
    allow($stdout).to receive(:write) { |output| @output.write(output) }
    allow($stdin).to receive(:gets) { @input.gets }
  end

  def simulate_input(*inputs)
    inputs.each { |input| @input.puts(input) }
    @input.rewind
  end

  it 'prompts the user for the number of dice and sides' do
    simulate_input('2', '6', '8', 'y')
    load './roller.rb'

    expect(@output.string).to include("Welcome to the dice roller!")
    expect(@output.string).to include("Enter the number of dice to roll:")
    expect(@output.string).to include("Enter the number of sides for each dice:")
  end

  it 'does not roll the dice if the user opts out' do
    simulate_input('2', '6', '8', 'n')
    load './roller.rb'

    expect(@output.string).to include("You have chosen not to roll the dice. Goodbye!")
  end
end
