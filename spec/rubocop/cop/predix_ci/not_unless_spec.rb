RSpec.describe RuboCop::Cop::PredixCi::NotUnless do
  subject(:cop) { described_class.new }

  it 'registers an offense for unless' do
    expect_offense(<<-RUBY.strip_indent)
      unless a_condition
      ^^^^^^^^^^^^^^^^^^ Favor `if !` over `unless` for negative conditions.
        some_method
      end
      some_method unless a_condition
      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Favor `if !` over `unless` for negative conditions.
    RUBY
  end

  it 'registers no offense with no unless in code' do
    expect_no_offenses(<<-RUBY.strip_indent)
      if a_condition
        some_method
      end
    RUBY
  end
end
