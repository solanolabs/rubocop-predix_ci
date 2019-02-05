RSpec.describe RuboCop::Cop::PredixCi::AuthenticateUserExcept do
  subject(:cop) { described_class.new }
  let(:offense_msg) { "Favor `except:` over `only:` for :authenticate_user! method" }

  it 'registers an offense for :only in :authenticate_user! method' do
    expect_offense(<<-RUBY.strip_indent)
      before_filter :authenticate_user!, only: ""
                                         ^^^^^^^^ #{offense_msg}
      before_filter :authenticate_user!, if: "some_method?", only: ""
                                                             ^^^^^^^^ #{offense_msg}
      before_action :authenticate_user!, :only => "", if: "some_method?"
                                         ^^^^^^^^^^^ #{offense_msg}
    RUBY
  end

  it 'registers no offense for :except in :authenticate_user! method' do
    expect_no_offenses(<<-RUBY.strip_indent)
      before_filter :authenticate_user!, except: ""
      before_filter :authenticate_user!, :except => "", :if => ""
      before_action :authenticate_user!, if: "", except: ""
    RUBY
  end
end
