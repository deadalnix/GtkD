/*
 * This file is part of gtkD.
 *
 * gtkD is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 3
 * of the License, or (at your option) any later version, with
 * some exceptions, please read the COPYING file.
 *
 * gtkD is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with gtkD; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
 */

// generated automatically - do not change
// find conversion definition on APILookup.txt
// implement new conversion functionalities on the wrap.utils pakage


module gsv.SourceCompletionProviderIF;

private import gdkpixbuf.Pixbuf;
private import glib.Str;
private import gobject.ObjectG;
private import gsv.SourceCompletionContext;
private import gsv.SourceCompletionInfo;
private import gsv.SourceCompletionProposalIF;
private import gsvc.gsv;
public  import gsvc.gsvtypes;
private import gtk.TextIter;
private import gtk.Widget;


public interface SourceCompletionProviderIF{
	/** Get the main Gtk struct */
	public GtkSourceCompletionProvider* getSourceCompletionProviderStruct();

	/** the main Gtk struct as a void* */
	protected void* getStruct();

	/**
	 */

	/**
	 * Activate @proposal at @iter. When this functions returns %FALSE, the default
	 * activation of @proposal will take place which replaces the word at @iter
	 * with the text of @proposal (see gtk_source_completion_proposal_get_text()).
	 *
	 * Here is how the default activation selects the boundaries of the word to
	 * replace. The end of the word is @iter. For the start of the word, it depends
	 * on whether a start iter is defined for @proposal (see
	 * gtk_source_completion_provider_get_start_iter()). If a start iter is defined,
	 * the start of the word is the start iter. Else, the word (as long as possible)
	 * will contain only alphanumerical and the "_" characters.
	 *
	 * Params:
	 *     proposal = a #GtkSourceCompletionProposal.
	 *     iter = a #GtkTextIter.
	 *
	 * Return: %TRUE to indicate that the proposal activation has been handled,
	 *     %FALSE otherwise.
	 */
	public bool activateProposal(SourceCompletionProposalIF proposal, TextIter iter);

	/**
	 * Get with what kind of activation the provider should be activated.
	 *
	 * Return: a combination of #GtkSourceCompletionActivation.
	 */
	public GtkSourceCompletionActivation getActivation();

	/**
	 * Get the icon of the provider.
	 *
	 * Return: The icon to be used for the provider,
	 *     or %NULL if the provider does not have a special icon.
	 */
	public Pixbuf getIcon();

	/**
	 * Get a customized info widget to show extra information of a proposal.
	 * This allows for customized widgets on a proposal basis, although in general
	 * providers will have the same custom widget for all their proposals and
	 * @proposal can be ignored. The implementation of this function is optional.
	 *
	 * If this function is not implemented, the default widget is a #GtkLabel. The
	 * return value of gtk_source_completion_proposal_get_info() is used as the
	 * content of the #GtkLabel.
	 *
	 * <note>
	 * <para>
	 * If implemented, gtk_source_completion_provider_update_info()
	 * <emphasis>must</emphasis> also be implemented.
	 * </para>
	 * </note>
	 *
	 * Params:
	 *     proposal = a currently selected #GtkSourceCompletionProposal.
	 *
	 * Return: a custom #GtkWidget to show extra
	 *     information about @proposal, or %NULL if the provider does not have a special
	 *     info widget.
	 */
	public Widget getInfoWidget(SourceCompletionProposalIF proposal);

	/**
	 * Get the delay in milliseconds before starting interactive completion for
	 * this provider. A value of -1 indicates to use the default value as set
	 * by the #GtkSourceCompletion:auto-complete-delay property.
	 *
	 * Return: the interactive delay in milliseconds.
	 */
	public int getInteractiveDelay();

	/**
	 * Get the name of the provider. This should be a translatable name for
	 * display to the user. For example: _("Document word completion provider"). The
	 * returned string must be freed with g_free().
	 *
	 * Return: a new string containing the name of the provider.
	 */
	public string getName();

	/**
	 * Get the provider priority. The priority determines the order in which
	 * proposals appear in the completion popup. Higher priorities are sorted
	 * before lower priorities. The default priority is 0.
	 *
	 * Return: the provider priority.
	 */
	public int getPriority();

	/**
	 * Get the #GtkTextIter at which the completion for @proposal starts. When
	 * implemented, this information is used to position the completion window
	 * accordingly when a proposal is selected in the completion window. The
	 * @proposal text inside the completion window is aligned on @iter.
	 *
	 * If this function is not implemented, the word boundary is taken to position
	 * the completion window. See gtk_source_completion_provider_activate_proposal()
	 * for an explanation on the word boundaries.
	 *
	 * When the @proposal is activated, the default handler uses @iter as the start
	 * of the word to replace. See
	 * gtk_source_completion_provider_activate_proposal() for more information.
	 *
	 * Params:
	 *     context = a #GtkSourceCompletionContext.
	 *     proposal = a #GtkSourceCompletionProposal.
	 *     iter = a #GtkTextIter.
	 *
	 * Return: %TRUE if @iter was set for @proposal, %FALSE otherwise.
	 */
	public bool getStartIter(SourceCompletionContext context, SourceCompletionProposalIF proposal, out TextIter iter);

	/**
	 * Get whether the provider match the context of completion detailed in
	 * @context.
	 *
	 * Params:
	 *     context = a #GtkSourceCompletionContext.
	 *
	 * Return: %TRUE if @provider matches the completion context, %FALSE otherwise.
	 */
	public bool match(SourceCompletionContext context);

	/**
	 * Populate @context with proposals from @provider added with the
	 * gtk_source_completion_context_add_proposals() function.
	 *
	 * Params:
	 *     context = a #GtkSourceCompletionContext.
	 */
	public void populate(SourceCompletionContext context);

	/**
	 * Update extra information shown in @info for @proposal.
	 *
	 * <note>
	 * <para>
	 * This function <emphasis>must</emphasis> be implemented when
	 * gtk_source_completion_provider_get_info_widget() is implemented.
	 * </para>
	 * </note>
	 *
	 * Params:
	 *     proposal = a #GtkSourceCompletionProposal.
	 *     info = a #GtkSourceCompletionInfo.
	 */
	public void updateInfo(SourceCompletionProposalIF proposal, SourceCompletionInfo info);
}
