<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>


<div class="container">
    <div class="row">
        <c:if test="${not empty message}">
            <div class="col-md-12">
                <div class="alert alert-success alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                        ${message}
                </div>
            </div>
        </c:if>


        <div class="col-md-offset-2 col-md-8">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h4>Product</h4>
                </div>
                <div class="panel-body">
                    <sf:form class="form-horizontal" modelAttribute="product" action="${contextRoot}/manage/products"
                             method="post" enctype="multipart/form-data">

                        <div class="form-group">
                            <label class="control-label col-md-4" for="name">Enter Product Name</label>
                            <div class="col-md-8">
                                <sf:input type="text" path="name" id="name" placeholder="Name" class="form-control"/>
                                <sf:errors path="name" cssClass="help-block" element="em"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4" for="brand">Enter Brand Name</label>
                            <div class="col-md-8">
                                <sf:input type="text" path="brand" id="brand" placeholder="Brand" class="form-control"/>
                                <sf:errors path="brand" cssClass="help-block" element="em"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4" for="description">Product Description</label>
                            <div class="col-md-8">
                                <sf:textarea type="text" path="description" id="description" rows="5"
                                             placeholder="Description" class="form-control"/>
                                <sf:errors path="description" cssClass="help-block" element="em"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4" for="unitPrice">Enter Unit Price</label>
                            <div class="col-md-8">
                                <sf:input type="number" path="unitPrice" id="unitPrice" placeholder="Unit Price"
                                          class="form-control"/>
                                <sf:errors path="unitPrice" cssClass="help-block" element="em"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4" for="quantity">Quantity Available</label>
                            <div class="col-md-8">
                                <sf:input type="number" path="quantity" id="quantity" placeholder="Quantity Available"
                                          class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4" for="file">Select Image</label>
                            <div class="col-md-8">
                                <sf:input type="file" path="file" id="file" class="form-control"/>
                                <sf:errors path="file" cssClass="help-block" element="em"/>

                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-4" for="categoryId">Select Category</label>
                            <div class="col-md-8">
                                <sf:select class="form-control" id="categoryId" path="categoryId"
                                           items="${categories}"
                                           itemLabel="name"
                                           itemValue="id"
                                />
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-offset-4 col-md-8">
                                <input type="submit" name="submit" id="submit" value="submit" class="btn btn-primary"/>
                                <sf:hidden path="id"/>
                                <sf:hidden path="code"/>
                                <sf:hidden path="supplierId"/>
                                <sf:hidden path="active"/>
                                <sf:hidden path="purchases"/>
                                <sf:hidden path="views"/>
                            </div>
                        </div>
                    </sf:form>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <h3>Avilable Product</h3>
            <hr/>
        </div>
        <div class="col-md-12">
            <div style="overflow:auto">
                <table id="productListTablee" class="table table-striped table-bordered">

                    <thead>
                    <tr>
                        <th></th>
                        <th>Name</th>
                        <th>Brand</th>
                        <th>Price</th>
                        <th>Qty. Available</th>
                        <th></th>
                    </tr>
                    </thead>


                    <tfoot>
                    <tr>
                        <th></th>
                        <th>Name</th>
                        <th>Brand</th>
                        <th>Price</th>
                        <th>Qty. Available</th>
                        <th></th>
                    </tr>
                    </tfoot>


                </table>
            </div>
        </div>
    </div>




</div>