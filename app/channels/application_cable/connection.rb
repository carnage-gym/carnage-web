module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      set_current_user || reject_unauthorized_connection
    end

    private

    def set_current_user
      if session = Session.find_by(id: cookies.signed[:session_id]) # standard:disable Lint/AssignmentInCondition
        self.current_user = session.user
      end
    end
  end
end
