class User < ApplicationRecord
  rolify
  # has_and_belongs_to_many :roles
  has_one :client, dependent: :destroy
  has_one :inboxe, :dependent => :delete
  has_one :gameboard, :dependent => :delete
  has_many :my_items, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :vks, :through => :appointments
  has_many :gameboards, -> { distinct }, :through => :votes
  has_many :visiblegroups, dependent: :destroy
  has_many :groupsvks, :through => :visiblegroups
  has_many :votes, as: :voteable, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable
  # def remember_me
  #   true
  # end
  # validates_presence_of   :username, if: :username_required?  
  # validates_presence_of   :email, if: :email_required?
  # validates_uniqueness_of :email, allow_blank: true, if: :email_changed?
  # validates_format_of     :email, with: email_regexp, allow_blank: true, if: :email_changed?

  # validates_presence_of     :password, if: :password_required?
  # validates_confirmation_of :password, if: :password_required?
  # validates_length_of       :password, within: password_length, allow_blank: true
  
    # enum role: [:user, :voodoo, :admin, :superadmin, :client]
    # необходимо вначале задеплоить таблицу кланы, с закоменченной моделью и кодом ниже
    # внести первую роль user и после можно раскомменыивать код парсящий кланы в массив
  # clans = Clan.all
  # @roles =[]
  # clans.each do |i|
  #   @roles << i.clan
  # end
  # enum role: @roles

  after_initialize :set_default_role, :if => :new_record?
  after_create :gboard
  def gboard
    @gameboard = Gameboard.new
        
    @gameboard.user_id = self.id
    @gameboard.expirience = 1
    puts 'sssssssssssss'*10 
    puts @gameboard.inspect
    puts 'sssssssssssss'*10 
    @gameboard.save!
  end
  def set_default_role
    # self.role ||= :user
    self.add_role :user
    self.add_role :applicant
  end
  protected
  # From Devise module Validatable
  def password_required?
    !persisted? || !password.nil? || !password_confirmation.nil?
  end

  # From Devise module Validatable
  def email_required?
    true
  end
  def username_required?
    true
  end
end
