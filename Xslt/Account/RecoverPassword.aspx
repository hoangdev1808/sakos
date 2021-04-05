<%@ Page Language="C#" AutoEventWireup="false" MasterPageFile="~/App_MasterPages/layoutSecure.Master"
    CodeBehind="RecoverPassword.aspx.cs" Inherits="CanhCam.Web.UI.Pages.RecoverPassword" %>

<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
	<section class="section recover-password">
		<div class="login-box">
			<div class="container">
				<div class="wrapper-login">
					<div class="login-logo">
						<portal:HeadingControl ID="headingControl"
							Text="<%$Resources:Resource, SignInSendPasswordButton %>" runat="server" />
					</div>
					<div class="card">
						<div class="card-body login-card-body">
							<asp:PasswordRecovery ID="PasswordRecovery1" runat="server">
								<UserNameTemplate>
									<p class="login-box-msg">
										<asp:Label ID="lblEnterUserName" runat="server" />
									</p>
									<asp:Panel ID="pnlRecover" runat="server" DefaultButton="SubmitButton">
										<portal:gbLabel ID="FailureText" CssClass="alert alert-danger" runat="server" />
										<div class="input-group">
											<asp:TextBox ID="UserName" runat="server" MaxLength="100"
												CssClass="form-control" />
											<div class="input-group-icon">
												<span class="ri-mail-fill"></span>
											</div>
											<asp:RequiredFieldValidator ID="UserNameRequired" runat="server"
												SetFocusOnError="true" ControlToValidate="UserName" Display="Dynamic"
												ValidationGroup="PasswordRecovery1"></asp:RequiredFieldValidator>
										</div>
										<div class="input-group">
											<asp:Panel class="captcha" ID="divCaptcha" runat="server">
												<telerik:RadCaptcha ID="captcha" runat="server"
													ValidationGroup="PasswordRecovery1" EnableRefreshImage="true"
													CaptchaTextBoxCssClass="form-control" CaptchaTextBoxLabel=""
													ErrorMessage="<%$Resources:Resource, CaptchaFailureMessage %>"
													CaptchaTextBoxTitle="<%$Resources:Resource, CaptchaInstructions %>"
													CaptchaLinkButtonText="<%$Resources:Resource, CaptchaRefreshImage %>" />
											</asp:Panel>
										</div>
										<div class="buttom">
											<asp:Button CssClass="btn btn-primary btn-block" ID="SubmitButton"
												runat="server" CommandName="Submit"
												ValidationGroup="PasswordRecovery1" />
										</div>
									</asp:Panel>
								</UserNameTemplate>
								<QuestionTemplate>
									<asp:Panel ID="pnlRecover2" runat="server" DefaultButton="SubmitButton">
										<div class="mrb10">
											<gb:SiteLabel ID="sitelabel4" runat="server" ConfigKey="HelloLabel"
												UseLabelTag="false" />
											<asp:Literal ID="UserName" runat="server" />
										</div>
										<div class="mrb10">
											<gb:SiteLabel ID="sitelabel5" runat="server"
												ConfigKey="PasswordQuestionLabel" />
											<br />
											<strong>
												<asp:Literal ID="Question" runat="server" /></strong>
										</div>
										<div class="mrb10">
											<asp:TextBox ID="Answer" runat="server" CssClass="verywidetextbox" />
											<asp:RequiredFieldValidator ID="AnswerRequired" runat="server"
												ControlToValidate="Answer" Display="Dynamic"
												ValidationGroup="PasswordRecovery1"></asp:RequiredFieldValidator>
											<br />
											<asp:Button SkinID="DefaultButton" ID="SubmitButton" runat="server"
												CommandName="Submit" ValidationGroup="PasswordRecovery1" />
										</div>
										<portal:gbLabel ID="FailureText" runat="server" CssClass="alert alert-danger" />
									</asp:Panel>
								</QuestionTemplate>
								<SuccessTemplate>
									<gb:SiteLabel ID="successLabel" runat="server" CssClass="alert alert-success"
										ConfigKey="PasswordRecoverySuccessMessage" />
									<portal:gbLabel ID="EmailLabel" runat="server" CssClass="alert alert-success" />
								</SuccessTemplate>
							</asp:PasswordRecovery>
							<portal:gbLabel ID="lblMailError" runat="server" CssClass="alert alert-danger" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</asp:Content>
