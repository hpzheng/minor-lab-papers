# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121203194542) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "username",               :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true
  add_index "admin_users", ["username"], :name => "index_admin_users_on_username", :unique => true

  create_table "auth_group", :force => true do |t|
    t.string "name", :limit => 80, :null => false
  end

  add_index "auth_group", ["name"], :name => "auth_group_name_key", :unique => true

  create_table "auth_group_permissions", :force => true do |t|
    t.integer "group_id",      :null => false
    t.integer "permission_id", :null => false
  end

  add_index "auth_group_permissions", ["group_id", "permission_id"], :name => "auth_group_permissions_group_id_key", :unique => true
  add_index "auth_group_permissions", ["group_id"], :name => "auth_group_permissions_group_id"
  add_index "auth_group_permissions", ["permission_id"], :name => "auth_group_permissions_permission_id"

  create_table "auth_message", :force => true do |t|
    t.integer "user_id", :null => false
    t.text    "message", :null => false
  end

  add_index "auth_message", ["user_id"], :name => "auth_message_user_id"

  create_table "auth_permission", :force => true do |t|
    t.string  "name",            :limit => 50,  :null => false
    t.integer "content_type_id",                :null => false
    t.string  "codename",        :limit => 100, :null => false
  end

  add_index "auth_permission", ["content_type_id", "codename"], :name => "auth_permission_content_type_id_key", :unique => true
  add_index "auth_permission", ["content_type_id"], :name => "auth_permission_content_type_id"

  create_table "auth_user", :force => true do |t|
    t.string   "username",     :limit => 30,  :null => false
    t.string   "first_name",   :limit => 30,  :null => false
    t.string   "last_name",    :limit => 30,  :null => false
    t.string   "email",        :limit => 75,  :null => false
    t.string   "password",     :limit => 128, :null => false
    t.boolean  "is_staff",                    :null => false
    t.boolean  "is_active",                   :null => false
    t.boolean  "is_superuser",                :null => false
    t.datetime "last_login",                  :null => false
    t.datetime "date_joined",                 :null => false
  end

  add_index "auth_user", ["username"], :name => "auth_user_username_key", :unique => true

  create_table "auth_user_groups", :force => true do |t|
    t.integer "user_id",  :null => false
    t.integer "group_id", :null => false
  end

  add_index "auth_user_groups", ["group_id"], :name => "auth_user_groups_group_id"
  add_index "auth_user_groups", ["user_id", "group_id"], :name => "auth_user_groups_user_id_key", :unique => true
  add_index "auth_user_groups", ["user_id"], :name => "auth_user_groups_user_id"

  create_table "auth_user_user_permissions", :force => true do |t|
    t.integer "user_id",       :null => false
    t.integer "permission_id", :null => false
  end

  add_index "auth_user_user_permissions", ["permission_id"], :name => "auth_user_user_permissions_permission_id"
  add_index "auth_user_user_permissions", ["user_id", "permission_id"], :name => "auth_user_user_permissions_user_id_key", :unique => true
  add_index "auth_user_user_permissions", ["user_id"], :name => "auth_user_user_permissions_user_id"

  create_table "django_admin_log", :force => true do |t|
    t.datetime "action_time",                    :null => false
    t.integer  "user_id",                        :null => false
    t.integer  "content_type_id"
    t.text     "object_id"
    t.string   "object_repr",     :limit => 200, :null => false
    t.integer  "action_flag",     :limit => 2,   :null => false
    t.text     "change_message",                 :null => false
  end

  add_index "django_admin_log", ["content_type_id"], :name => "django_admin_log_content_type_id"
  add_index "django_admin_log", ["user_id"], :name => "django_admin_log_user_id"

  create_table "django_content_type", :force => true do |t|
    t.string "name",      :limit => 100, :null => false
    t.string "app_label", :limit => 100, :null => false
    t.string "model",     :limit => 100, :null => false
  end

  add_index "django_content_type", ["app_label", "model"], :name => "django_content_type_app_label_key", :unique => true

  create_table "django_session", :id => false, :force => true do |t|
    t.string   "session_key",  :limit => 40, :null => false
    t.text     "session_data",               :null => false
    t.datetime "expire_date",                :null => false
  end

  add_index "django_session", ["expire_date"], :name => "django_session_expire_date"

  create_table "django_site", :force => true do |t|
    t.string "domain", :limit => 100, :null => false
    t.string "name",   :limit => 50,  :null => false
  end

  create_table "document_types", :force => true do |t|
    t.string   "doc_type"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "manuscripts", :force => true do |t|
    t.integer  "publication_id"
    t.string   "title"
    t.integer  "version"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "manuscript"
    t.integer  "document_type_id"
  end

  create_table "papers_absence", :force => true do |t|
    t.integer "person_id",             :null => false
    t.boolean "notification",          :null => false
    t.integer "absence_type_id",       :null => false
    t.date    "begin_date",            :null => false
    t.date    "end_date"
    t.integer "contact_type_id",       :null => false
    t.integer "response_frequency_id", :null => false
  end

  add_index "papers_absence", ["absence_type_id"], :name => "papers_absence_absence_type_id"
  add_index "papers_absence", ["contact_type_id"], :name => "papers_absence_contact_type_id"
  add_index "papers_absence", ["person_id"], :name => "papers_absence_person_id"
  add_index "papers_absence", ["response_frequency_id"], :name => "papers_absence_response_frequency_id"

  create_table "papers_absence_type", :force => true do |t|
    t.string "absence_type", :limit => 50, :null => false
  end

  create_table "papers_attachment", :force => true do |t|
    t.integer  "publication_id",                :null => false
    t.string   "file",           :limit => 100, :null => false
    t.integer  "author_id",                     :null => false
    t.integer  "version"
    t.datetime "entry_date",                    :null => false
  end

  add_index "papers_attachment", ["author_id"], :name => "papers_attachment_author_id"
  add_index "papers_attachment", ["publication_id"], :name => "papers_attachment_publication_id"

  create_table "papers_author", :force => true do |t|
    t.string "firstname", :limit => 15, :null => false
    t.string "lastname",  :limit => 15, :null => false
    t.string "email",     :limit => 50, :null => false
    t.string "phone",     :limit => 30
    t.string "skype",     :limit => 30
  end

  create_table "papers_contact_type", :force => true do |t|
    t.string "contact_type", :limit => 5, :null => false
  end

  create_table "papers_frequency", :force => true do |t|
    t.string  "description", :limit => 50, :null => false
    t.integer "days",                      :null => false
  end

  create_table "papers_journal", :force => true do |t|
    t.string "journal_name", :limit => 200, :null => false
    t.string "journal_abbr", :limit => 50,  :null => false
    t.string "url",          :limit => 200, :null => false
  end

  create_table "papers_notification", :force => true do |t|
    t.integer "person_id",            :null => false
    t.boolean "notification",         :null => false
    t.date    "begin_date",           :null => false
    t.integer "report_frequency_id",  :null => false
    t.integer "pastdue_frequency_id", :null => false
  end

  add_index "papers_notification", ["pastdue_frequency_id"], :name => "papers_notification_pastdue_frequency_id"
  add_index "papers_notification", ["person_id"], :name => "papers_notification_person_id"
  add_index "papers_notification", ["report_frequency_id"], :name => "papers_notification_report_frequency_id"

  create_table "papers_publication", :force => true do |t|
    t.integer  "first_author_id",                      :null => false
    t.integer  "second_author_id"
    t.integer  "third_author_id"
    t.integer  "target_journal_id"
    t.string   "topic",                 :limit => 200, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "deadline"
    t.boolean  "active"
    t.integer  "proofreader_id"
    t.integer  "responsible_person_id"
  end

  add_index "papers_publication", ["first_author_id"], :name => "papers_publication_first_author_id"
  add_index "papers_publication", ["second_author_id"], :name => "papers_publication_second_author_id"
  add_index "papers_publication", ["target_journal_id"], :name => "papers_publication_target_journal_id"
  add_index "papers_publication", ["third_author_id"], :name => "papers_publication_third_author_id"

  create_table "papers_publication_referee_jcn", :force => true do |t|
    t.integer  "publication_id", :null => false
    t.integer  "referee_id",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "papers_publication_referee_jcn", ["publication_id"], :name => "papers_publication_referee_jcn_publication_id"
  add_index "papers_publication_referee_jcn", ["referee_id"], :name => "papers_publication_referee_jcn_referee_id"

  create_table "papers_publication_status_jcn", :force => true do |t|
    t.integer  "publication_id",                       :null => false
    t.integer  "status_id",                            :null => false
    t.integer  "person_responsible_id"
    t.string   "description",           :limit => 200
    t.date     "due_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "papers_publication_status_jcn", ["person_responsible_id"], :name => "papers_publication_status_jcn_person_responsible_id"
  add_index "papers_publication_status_jcn", ["publication_id"], :name => "papers_publication_status_jcn_publication_id"
  add_index "papers_publication_status_jcn", ["status_id"], :name => "papers_publication_status_jcn_status_id"

  create_table "papers_referee", :force => true do |t|
    t.string "firstname",    :limit => 15,  :null => false
    t.string "lastname",     :limit => 15,  :null => false
    t.string "email",        :limit => 50,  :null => false
    t.string "department",   :limit => 100
    t.string "organization", :limit => 100, :null => false
  end

  create_table "papers_status", :force => true do |t|
    t.integer "priority",               :null => false
    t.string  "status",   :limit => 50, :null => false
  end

  create_table "publication_attachments", :force => true do |t|
    t.string   "attachment"
    t.integer  "version"
    t.integer  "publication_id"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
