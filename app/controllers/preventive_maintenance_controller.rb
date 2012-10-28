class PreventiveMaintenanceController < ApplicationController

  def index
  	@locations = Location.all
  end

  def start
  	@location = Location.find(params[:location])
    session[:maintenance_start_time] = Time.now if(session[:maintenance_start_time].nil?)
  	@start_time = session[:maintenance_start_time]
  	@tester = params[:tester]
  	@equipment = Equipment.find(:all, :conditions => "location_id = #{params[:location]}", :order => "name")

  	session[:maintenance_tester] = @tester.nil? ? 'todo' : @tester
    session[:maintenance_location_id] = params[:location]
  end

  def finish
    if(!session.has_key?(:maintenance_location_id) || !session.has_key?(:maintenance_tester) || !session.has_key?(:maintenance_start_time))
      raise ActionController::RoutingError.new(t('preventive_maintenance.finish.session_empty',
       :default => t("helpers.links.session_empty")))
    end
    location_id = session[:maintenance_location_id]
    report_id = "#{session[:maintenance_tester]}_#{session[:maintenance_start_time]}_#{location_id}".tr(" :,\.",'')
    @report_html = "/reports/#{report_id}.htm"
    @report_pdf = "/reports/#{report_id}.pdf"
    #generating html report
    report_contents = render_to_string :file => "#{Rails.root}/app/views/preventive_maintenance/report_template.html.erb",
          :layout => 'report',
          :locals => { 
            :start_time => session[:maintenance_start_time], 
            :tester => session[:maintenance_tester],
            :location => Location.find(location_id),
            :equipment => Equipment.find(:all, :conditions => "location_id = #{location_id}", :order => "name"),
            :changes => session[:maintenance_changes],
            :notes => params[:notes] }
    File.open("public/reports/#{report_id}.htm", 'w') do |f|
        f.write report_contents
    end
    #generating pdf report
    pdf = WickedPdf.new.pdf_from_string(report_contents)
    File.open("public/reports/#{report_id}.pdf", 'wb') do |file|
      file << pdf
    end

    session.delete(:maintenance_location_id)
    session.delete(:maintenance_tester)
    session.delete(:maintenance_changes) if(session.has_key?(:maintenance_changes))
    session.delete(:maintenance_start_time)
  end
end
