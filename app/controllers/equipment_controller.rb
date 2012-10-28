#!/bin/env ruby
# encoding: utf-8
class EquipmentController < ApplicationController
  # GET /equipment
  # GET /equipment.json
  def index
    @equipment = Equipment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @equipment }
    end
  end

  # GET /equipment/1
  # GET /equipment/1.json
  def show
    @equipment = Equipment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @equipment }
    end
  end

  # GET /equipment/new
  # GET /equipment/new.json
  def new
    @equipment = Equipment.new
    @equipment.attribute_values.new(AttributeType.all.map { |e| {attribute_type_id: e.id} })

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @equipment }
    end
  end

  # GET /equipment/1/edit
  def edit
    @from_maintenance = params.has_key?(:maintenance) ? true : false
    
    @equipment = Equipment.find(params[:id])
    all_attr = AttributeType.all.map { |e| {attribute_type_id: e.id} }
    all_attr.delete_if {|e| @equipment.attribute_values.any? { |x| x[:attribute_type_id] == e[:attribute_type_id]}}
    @equipment.attribute_values.new(all_attr)
  end

  # POST /equipment
  # POST /equipment.json
  def create
    @equipment = Equipment.new(params[:equipment])

    respond_to do |format|
      if @equipment.save
        format.html { redirect_to @equipment, notice: 'Обладнання успішно стровено.' }
        format.json { render json: @equipment, status: :created, location: @equipment }
      else
        all_attr = AttributeType.all.map { |e| {attribute_type_id: e.id} }
        all_attr.delete_if {|e| @equipment.attribute_values.any? { |x| x[:attribute_type_id] == e[:attribute_type_id]}}
        @equipment.attribute_values.new(all_attr)
        format.html { render action: "new" }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /equipment/1
  # PUT /equipment/1.json
  def update
    #Troilk's code
    redir = true
    if params.has_key?(:maintenance)
        redir = false
        (session[:maintenance_changes] ||= []) << params[:id]
      end
    #

    @equipment = Equipment.find(params[:id])

    respond_to do |format|
      if @equipment.update_attributes(params[:equipment])
        if redir
          format.html { redirect_to @equipment, notice: 'Обладнення успішно оновлено.' }
        else
          format.html { redirect_to edit_equipment_path(:maintenance => true), notice: 'Обладнення успішно оновлено.' }
        end
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipment/1
  # DELETE /equipment/1.json
  def destroy
    @equipment = Equipment.find(params[:id])
    @equipment.destroy

    respond_to do |format|
      format.html { redirect_to equipment_index_url }
      format.json { head :no_content }
    end
  end
end
