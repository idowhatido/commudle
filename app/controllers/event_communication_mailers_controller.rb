class EventCommunicationMailersController<ApplicationController
  before_action :authenticate_user!


  def event_data_form_entity_response_group_rsvp_email
    @dferg = DataFormEntityResponseGroup.includes(:user, event_data_form_entity_group: :event).find(params[:data_form_entity_response_group])
    @event = @dferg.event_data_form_entity_group.event
    @user = @dferg.user

  end



  def send_data_form_entity_response_group_rsvp_email

    DataFormEntityResponseGroup.send_rsvp_email([params[:id]], params[:subject], params[:message])

  end


  def event_data_form_entity_group_rsvp_email


  end


  def send_data_form_entity_group_rsvp_email
    registration_status = params[:registration_status]
    edfeg_id = params[:event_data_form_entity_group].to_i

    case registration_status
      when "all"
        DataFormEntityResponseGroup.send_rsvp_email(DataFormEntityResponseGroup.joins(:registration_status).where('data_form_entity_group_id = ?', edfeg_id, registration_status).map(&:id))
      else
        DataFormEntityResponseGroup.send_rsvp_email(DataFormEntityResponseGroup.joins(:registration_status).where('data_form_entity_group_id = ? and registration_statuses.name == ?', edfeg_id, registration_status).map(&:id))
    end

  end



  # entry_pass emails are sent only to registration_status confirmed

  def send_data_form_entity_response_group_entry_pass_email

  end


  def send_data_form_entity_group_entry_pass_email

  end



end