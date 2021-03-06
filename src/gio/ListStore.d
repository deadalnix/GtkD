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


module gio.ListStore;

private import gio.ListModelIF;
private import gio.ListModelT;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtkc.gio;
public  import gtkc.giotypes;


/**
 * #GListStore is a simple implementation of #GListModel that stores all
 * items in memory.
 * 
 * It provides insertions, deletions, and lookups in logarithmic time
 * with a fast path for the common case of iterating the list linearly.
 */
public class ListStore : ObjectG, ListModelIF
{
	/** the main Gtk struct */
	protected GListStore* gListStore;

	/** Get the main Gtk struct */
	public GListStore* getListStoreStruct()
	{
		return gListStore;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gListStore;
	}

	protected override void setStruct(GObject* obj)
	{
		gListStore = cast(GListStore*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GListStore* gListStore, bool ownedRef = false)
	{
		this.gListStore = gListStore;
		super(cast(GObject*)gListStore, ownedRef);
	}

	// add the ListModel capabilities
	mixin ListModelT!(GListStore);

	/**
	 */

	public static GType getType()
	{
		return g_list_store_get_type();
	}

	/**
	 * Creates a new #GListStore with items of type @item_type. @item_type
	 * must be a subclass of #GObject.
	 *
	 * Params:
	 *     itemType = the #GType of items in the list
	 *
	 * Return: a new #GListStore
	 *
	 * Since: 2.44
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(GType itemType)
	{
		auto p = g_list_store_new(itemType);
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(GListStore*) p, true);
	}

	/**
	 * Appends @item to @store. @item must be of type #GListStore:item-type.
	 *
	 * This function takes a ref on @item.
	 *
	 * Use g_list_store_splice() to append multiple items at the same time
	 * efficiently.
	 *
	 * Params:
	 *     item = the new item
	 *
	 * Since: 2.44
	 */
	public void append(void* item)
	{
		g_list_store_append(gListStore, item);
	}

	/**
	 * Inserts @item into @store at @position. @item must be of type
	 * #GListStore:item-type or derived from it. @position must be smaller
	 * than the length of the list, or equal to it to append.
	 *
	 * This function takes a ref on @item.
	 *
	 * Use g_list_store_splice() to insert multiple items at the same time
	 * efficiently.
	 *
	 * Params:
	 *     position = the position at which to insert the new item
	 *     item = the new item
	 *
	 * Since: 2.44
	 */
	public void insert(uint position, void* item)
	{
		g_list_store_insert(gListStore, position, item);
	}

	/**
	 * Inserts @item into @store at a position to be determined by the
	 * @compare_func.
	 *
	 * The list must already be sorted before calling this function or the
	 * result is undefined.  Usually you would approach this by only ever
	 * inserting items by way of this function.
	 *
	 * This function takes a ref on @item.
	 *
	 * Params:
	 *     item = the new item
	 *     compareFunc = pairwise comparison function for sorting
	 *     userData = user data for @compare_func
	 *
	 * Return: the position at which @item was inserted
	 *
	 * Since: 2.44
	 */
	public uint insertSorted(void* item, GCompareDataFunc compareFunc, void* userData)
	{
		return g_list_store_insert_sorted(gListStore, item, compareFunc, userData);
	}

	/**
	 * Removes the item from @store that is at @position. @position must be
	 * smaller than the current length of the list.
	 *
	 * Use g_list_store_splice() to remove multiple items at the same time
	 * efficiently.
	 *
	 * Params:
	 *     position = the position of the item that is to be removed
	 *
	 * Since: 2.44
	 */
	public void remove(uint position)
	{
		g_list_store_remove(gListStore, position);
	}

	/**
	 * Removes all items from @store.
	 *
	 * Since: 2.44
	 */
	public void removeAll()
	{
		g_list_store_remove_all(gListStore);
	}

	/**
	 * Changes @store by removing @n_removals items and adding @n_additions
	 * items to it. @additions must contain @n_additions items of type
	 * #GListStore:item-type.  %NULL is not permitted.
	 *
	 * This function is more efficient than g_list_store_insert() and
	 * g_list_store_remove(), because it only emits
	 * #GListModel::items-changed once for the change.
	 *
	 * This function takes a ref on each item in @additions.
	 *
	 * The parameters @position and @n_removals must be correct (ie:
	 * @position + @n_removals must be less than or equal to the length of
	 * the list at the time this function is called).
	 *
	 * Params:
	 *     position = the position at which to make the change
	 *     nRemovals = the number of items to remove
	 *     additions = the items to add
	 *     nAdditions = the number of items to add
	 *
	 * Since: 2.44
	 */
	public void splice(uint position, uint nRemovals, void*[] additions)
	{
		g_list_store_splice(gListStore, position, nRemovals, additions.ptr, cast(uint)additions.length);
	}
}
