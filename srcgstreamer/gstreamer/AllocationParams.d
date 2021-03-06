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


module gstreamer.AllocationParams;

private import gobject.ObjectG;
private import gstreamerc.gstreamer;
public  import gstreamerc.gstreamertypes;


/**
 * Parameters to control the allocation of memory
 */
public class AllocationParams
{
	/** the main Gtk struct */
	protected GstAllocationParams* gstAllocationParams;

	/** Get the main Gtk struct */
	public GstAllocationParams* getAllocationParamsStruct()
	{
		return gstAllocationParams;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstAllocationParams;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstAllocationParams* gstAllocationParams)
	{
		this.gstAllocationParams = gstAllocationParams;
	}

	/**
	 */

	public static GType getType()
	{
		return gst_allocation_params_get_type();
	}

	/**
	 * Create a copy of @params.
	 *
	 * Free-function: gst_allocation_params_free
	 *
	 * Return: a new ##GstAllocationParams, free with
	 *     gst_allocation_params_free().
	 */
	public AllocationParams copy()
	{
		auto p = gst_allocation_params_copy(gstAllocationParams);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(AllocationParams)(cast(GstAllocationParams*) p);
	}

	/**
	 * Free @params
	 */
	public void free()
	{
		gst_allocation_params_free(gstAllocationParams);
	}

	/**
	 * Initialize @params to its default values
	 */
	public void init()
	{
		gst_allocation_params_init(gstAllocationParams);
	}
}
