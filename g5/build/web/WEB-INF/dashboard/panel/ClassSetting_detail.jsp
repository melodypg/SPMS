<%-- 
    Document   : settingDetails
    Created on : Aug 10, 2022, 10:19:14 AM
    Author     : quang
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Main Content-->
<div id="layoutAuthentication">
    <div id="layoutAuthentication_content">
        <main>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-7">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header"><h3 class="text-center font-weight-light my-4">Class Setting Details</h3></div>
                            <div class="card-body">
                                <form action="classSettingdetail" method="post">
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <input type="hidden" value="${a.setting_id}" name="id"/>
                                            <p class="text-medium-emphasis">Type<label class="required">(*)</label></p>
                                            <select class="form-select" aria-label="Default select example" name="type_id">
                                                <option value="0">All</option>
                                                <option value="1">Open</option>
                                                <option value="2">Close</option>
                                                <option value="3">Cancelled</option>
                                            </select>
                                        </div>
                                        <div class="col-md-6">
                                            <p class="text-medium-emphasis">Order<label class="required">(*)</label></p>
                                            <input class="form-control" id="inputOrder" name="order" type="number" value="${a.display_order}" required pattern="[-+]?[0-9]" min="0" max="1000" title="number 0-1000 only!">
                                        </div>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <p class="text-medium-emphasis">Title<label class="required">(*)</label></p>
                                        <input class="form-control" id="inputName" name="title" type="text" value="${a.setting_title}" required pattern="[A-Za-z0-9 ]+" minlength="3" maxlength="15">
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <p class="text-medium-emphasis">Value</p><br>
                                            <input class="form-control" id="inputValue" name="value" type="text" value="${a.setting_value}">
                                        </div>
                                        <div class="col-md-6">
                                            <p class="text-medium-emphasis">Status</p>
                                            <div class="col-md-6">
                                                <input type="radio" id="active" name="status" value="active" class="status"
                                                       checked="true">
                                                <label for="active">Active</label>
                                            </div>
                                            <div class="col-md-6">
                                                <input type="radio" id="inactive" name="status" value="inactive" class="status">
                                                <label for="inactive">Inactive</label>
                                            </div>
                                        </div>
                                    </div>    
                                    <div class="form-floating mb-3">
                                        <p class="text-medium-emphasis">Description</p>
                                        <textarea id="description" name="description" rows="5" cols="50">${a.description}</textarea>
                                    </div>
                                    <div class="mt-4 mb-0">
                                        <div class="d-grid"> <input type="submit"class="btn btn-primary btn-block" value="Save"/>  </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

