module TopicsHelper
   def user_is_authorized_for_topics?
        current_user && current_user.admin?
   end

   def user_can_edit_topics?
	current_user && current_user.moderator?
   end
end
