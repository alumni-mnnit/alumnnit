RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  #config.authenticate_with do
  #   warden.authenticate! scope: :user
  #end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan
  config.current_user_method(&:current_user)

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration
  #config.authorize_with do
    
  #    redirect_to main_app.root_path unless current_user and current_user.is_admin == true
      #redirect_to main_app.root_path unless warden.user.is_admin == true   

  #end
  config.model 'User' do
    list do 
      field :id
      field :email
      field :fname do
        label "First Name"
      end
      field :lname do
        label "Last Name"
      end
      field :nick_name
      field :pic
      field :is_active
      field :is_admin do 
        visible do 
          bindings[:view]._current_user.is_super_admin?
        end
      end
      field :is_super_admin do 
        visible do 
          bindings[:view]._current_user.is_super_admin?
        end
      end
      field :gender
      field :date_of_birth
      field :role
      field :reg_no
      field :degree
      field :branch
      field :year_of_passing, :string do
        formatted_value do
          value.year
        end

        export_value do
          value.year # used in exports, where no html/data is allowed
        end
      end
      field :phn_no
      field :curr_address
      field :h_town
      field :city
      field :country
      field :pincode
      field :company
      field :designation
      field :achievements
      field :request
      field :id_card_request
      field :id_card
      field :feedbacks
      field :convention_request
      include_all_fields

    end
    edit do
      include_all_fields
      field :is_admin do
        visible do
          bindings[:view]._current_user.is_super_admin?
        end
      end
      field :is_super_admin do
        visible do
          bindings[:view]._current_user.is_super_admin?
        end
      end
    end
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
