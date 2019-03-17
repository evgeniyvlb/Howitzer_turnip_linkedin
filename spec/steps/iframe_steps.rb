module IframeSteps

  # WHEN

  step 'I click on triple dot button' do
    HomePage.on do
      advertisement_iframe do |frame|
        frame.open_complaint_window
      end
    end
  end

  # THEN
  
  step 'the advertisement should be presented in top of page' do
    HomePage.on { is_expected.to have_advertisement_iframe }
  end

  step 'complaint window should be appeared' do
    HomePage.on { is_expected.to have_complaint_window_element }
  end

end
RSpec.configure { |c| c.include IframeSteps, iframe_steps: true }
