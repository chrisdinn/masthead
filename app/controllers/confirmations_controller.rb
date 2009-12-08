class ConfirmationsController < Clearance::ConfirmationsController
  skip_before_filter :go_sign_in
  
end