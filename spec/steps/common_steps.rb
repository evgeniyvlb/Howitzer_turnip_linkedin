module Turnip::Steps

  # GIVEN

  step 'there is connections page' do
    HomePage.open
    HomePage.on do
      login_form('postmaster@sandbox768af69706e34c53bedd31dc58a43b68.mailgun.org',
               'yepl_user1')
    end
    Connections.open
  end

  step 'there is messaging page' do
    HomePage.open
    HomePage.on do
      login_form('postmaster@sandbox999af69706e34c53bedd31dc58a43b68.mailgun.org',
               'yepl_user2')
    end
    Messaging.open
  end

  step 'there is main page' do
    HomePage.open
    HomePage.on do
      login_form('postmaster@sandbox999af69706e34c53bedd31dc58a43b68.mailgun.org',
               'yepl_user2')
    end
  end

  # WHEN

  step 'I click Send message to the right of the user name' do
    Connections.on do
      click_send_message
    end
  end

  step 'I send message via message form' do
    Connections.on do
      send_message("test_message")
    end
  end

  step 'I select sender in left sidebar' do
    Messaging.on do
      select_sender
    end
  end

  # THEN

  step 'connections page is open' do
    expect(Connections).to be_displayed
  end

  step 'pop up message form should be opened' do
    Connections.on { is_expected.to have_message_frame_element }
  end

  step 'confirmation pop up with sending status should be appeared' do
    Connections.on { is_expected.to have_confirmation_message_element }
  end

  step 'message should be appeared' do
    Messaging.on { is_expected.to have_message_text_element }
  end

end
